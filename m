Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EDBA934
	for <loongarch@lists.linux.dev>; Wed, 23 Aug 2023 08:22:59 +0000 (UTC)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1qYiCO-00071b-00; Wed, 23 Aug 2023 09:22:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id E31D4C0234; Wed, 23 Aug 2023 09:22:24 +0200 (CEST)
Date: Wed, 23 Aug 2023 09:22:24 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Trevor Woerner <twoerner@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 3/4] arch/mips/configs/*_defconfig cleanup
Message-ID: <ZOWzsAHxuHQLGsEa@alpha.franken.de>
References: <20230817115017.35663-1-twoerner@gmail.com>
 <20230817115017.35663-4-twoerner@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817115017.35663-4-twoerner@gmail.com>

On Thu, Aug 17, 2023 at 07:50:13AM -0400, Trevor Woerner wrote:
> Drop CONFIG_IP_NF_TARGET_CLUSTERIP from any remaining mips defconfigs as it
> was removed in commit 9db5d918e2c0 ("netfilter: ip_tables: remove clusterip
> target").
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  arch/mips/configs/ip22_defconfig        | 1 -
>  arch/mips/configs/malta_defconfig       | 1 -
>  arch/mips/configs/malta_kvm_defconfig   | 1 -
>  arch/mips/configs/maltaup_xpa_defconfig | 1 -
>  arch/mips/configs/rm200_defconfig       | 1 -
>  5 files changed, 5 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
