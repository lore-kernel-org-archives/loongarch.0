Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7377B
	for <loongarch@lists.linux.dev>; Sat, 22 Oct 2022 03:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79AAC433D6;
	Sat, 22 Oct 2022 03:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666410925;
	bh=89N+4GISvqQWb0Tijt5yj4RwXtZrZKRvKtcKUVVREJk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GETuklby2JHS+aXTFJaLhRgrftVC9jMoy97OABjkdd2t3NXG/XB0RcjgpMtEi3TPW
	 t25uX2D4MUeOoE2+Mje7rTtLeaXTsj71TPBZk9SADxS9KlYEW7+9SmDOiGYQlqm4N9
	 zWSbG9s5Zk5A2tKzkHGSMdV7wNowrrOt1NEwWyz6pxQCX238qjHaDM/fo67zs9yliy
	 iMHN839RU8fHVz8V1o0KqSlUe+jdJCA3eYc8eIFj8eKhelndFPxf1fDe9SyVZ6oGwu
	 aIoffChdbww4TvCiA1GR2ATkrR9THIve5f/l4GrAqaPxMcn6amarxedSWqtBaOE+7y
	 2QJD3oNb/sKXg==
Date: Fri, 21 Oct 2022 20:55:22 -0700
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
Message-ID: <20221021205522.6b56fd24@kernel.org>
In-Reply-To: <20221022014403.3881893-1-Jason@zx2c4.com>
References: <20221022014403.3881893-1-Jason@zx2c4.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 21 Oct 2022 21:43:58 -0400 Jason A. Donenfeld wrote:
> Since get_random_u32_below() sits in my random.git tree, these patches
> too will flow through that same tree.

How big is it?  Can you provide a stable branch to pull in the new
helpers and then everyone will be able to apply the patches to their
subsystem?

