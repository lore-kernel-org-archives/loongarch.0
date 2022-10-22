Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19C020F0
	for <loongarch@lists.linux.dev>; Sat, 22 Oct 2022 06:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E12E6C433C1;
	Sat, 22 Oct 2022 06:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666418605;
	bh=tCXdIEe/bRuPmuD8DZJI7sITbkxpBfee1t0FtUrlE1s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LGS4FPjZ0GenPE80Ht65ggEck6bgj5dMaBGUbmI1p5KIioZcU/U0B3w+tI1Dn25rx
	 llIng6acUhVuJ/HM4vaBISzwQ0bzbS9XtQmJ0Vcv4gBrkA4Yvn+Z2n4iaDXSOr93lP
	 6kE0ELPCFel8IWbq2XeR8VABeZZKCK5yTtr8p63JXPEROgpP0teOCA5RybzOekIHey
	 WO01JaNbJ4vidygloxS7RXdQaKTXIlWeMJqqphRYpzZR07P/w8/CEUZljrbdPYJwK0
	 sq4K9MbjRVh/iSW4OILqP9q7FbHb8Bp51AV9w0kHCsF0BcDX0ybnQzP/gy7AmQZBK5
	 pdal5+51PPfEA==
Date: Fri, 21 Oct 2022 23:03:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Heiko Carstens
 <hca@linux.ibm.com>, Herbert Xu <herbert@gondor.apana.org.au>, Christoph
 =?UTF-8?B?QsO2aG13YWxkZXI=?= <christoph.boehmwalder@linbit.com>, Jani
 Nikula <jani.nikula@linux.intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, "Martin K . Petersen"
 <martin.petersen@oracle.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger
 <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, Richard
 Weinberger <richard@nod.at>, "Darrick J . Wong" <djwong@kernel.org>,
 SeongJae Park <sj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew
 Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, netdev@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-mmc@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: Re: [PATCH v1 0/5] convert tree to
 get_random_u32_{below,above,between}()
Message-ID: <20221021230322.00dd045c@kernel.org>
In-Reply-To: <Y1OD2tdVwQsydSNV@zx2c4.com>
References: <20221022014403.3881893-1-Jason@zx2c4.com>
	<20221021205522.6b56fd24@kernel.org>
	<Y1NwJJOIB4gI5G11@zx2c4.com>
	<20221021223242.05df0a5b@kernel.org>
	<Y1OD2tdVwQsydSNV@zx2c4.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 22 Oct 2022 07:47:06 +0200 Jason A. Donenfeld wrote:
> On Fri, Oct 21, 2022 at 10:32:42PM -0700, Jakub Kicinski wrote:
> > But whatever. I mean - hopefully there aren't any conflicts in the ~50
> > networking files you touch. I just wish that people didn't pipe up with
> > the tree wide changes right after the merge window. Feels like the
> > worst possible timing.  
> 
> Oh, if the timing is what makes this especially worrisome, I have
> no qualms about rebasing much later, and reposting this series then.
> I'll do that.

Cool, thanks! I promise to not be grumpy if you repost around rc6 :)
