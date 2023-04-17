module MonarchMoney
  module Queries
    def get_accounts_page_query
      """
      query GetAccountsPage {
        hasAccounts
        accounts {
          id
          __typename
          syncDisabled
          isHidden
          isAsset
          includeInNetWorth
          order
          type {
            name
            display
            __typename
          }
          displayName
          displayBalance
          signedBalance
          updatedAt
          icon
          logoUrl
          includeBalanceInNetWorth
          displayLastUpdatedAt
          ...AccountMaskFields
          credential {
            id
            updateRequired
            dataProvider
            disconnectedFromDataProviderAt
            institution {
              id
              __typename
              logo
              name
              status
              plaidStatus
              hasIssuesReported
              url
              hasIssuesReportedMessage
              transactionsStatus
              balanceStatus
            }
            __typename
          }
        }
        householdPreferences {
          id
          accountGroupOrder
          __typename
        }
        accountTypes {
          name
          group
          __typename
        }
      }
      """
    end
  end
end
