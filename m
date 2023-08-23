Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267E6BA48
	for <loongarch@lists.linux.dev>; Wed, 23 Aug 2023 12:04:54 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4dw5RM5z4x5q;
	Wed, 23 Aug 2023 22:04:52 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linux-kernel@vger.kernel.org, Trevor Woerner <twoerner@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20230817115017.35663-1-twoerner@gmail.com>
References: <20230817115017.35663-1-twoerner@gmail.com>
Subject: Re: (subset) [PATCH v3 0/4] general defconfig cleanups
Message-Id: <169279175571.797584.3366844958085026479.b4-ty@ellerman.id.au>
Date: Wed, 23 Aug 2023 21:55:55 +1000
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Thu, 17 Aug 2023 07:50:10 -0400, Trevor Woerner wrote:
> Drop config options from defconfigs whose code has been removed.
> 
> v3:
> While reorganizing the patches, I put the wrong commit message with the
> CONFIG_IP_NF_TARGET_CLUSTERIP option.
> 
> v2:
> Generate arch-specific patches. In v1 I organized the patches by
> CONFIG_ option which caused some of the patches to cross architectural
> lines. This requires cross-arch consensus before they can be applied.
> Therefore organize the changes by architecture so each one can apply them
> independently (or not).
> 
> [...]

Patch 4 applied to powerpc/next.

[4/4] arch/powerpc/configs/*_defconfig cleanup
      https://git.kernel.org/powerpc/c/455d3d38ef9d5f69c504d1af5fa2359563ea4148

cheers
