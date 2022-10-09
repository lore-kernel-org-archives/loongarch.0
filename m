Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31FE7E
	for <loongarch@lists.linux.dev>; Sun,  9 Oct 2022 10:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1665311851;
	bh=J54On5AUhcm4ClBxiTcpnPQn1WKK6Rp1zpMkD36rdaU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Sd1p8jg6QFSVuFZ44YwupxEOOZ02rhipzEXlOZDyx3ZaKSjhiWn8TjJSfQtN902vk
	 z6YpjdIGDxd/H1WMblzbIfT7qa9tdAsRb1xJN/K0zHiR3HsTfVRpvgKv3vIdmwelO3
	 Z3mqkTztUDiOCylqnajFBFWxV7w3rzhAeBd8dqwI=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 139206680B;
	Sun,  9 Oct 2022 06:37:29 -0400 (EDT)
Message-ID: <19415767029b479a508378abaf8c6c5a1d048add.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: mm: Refactor TLB handlers
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>, Rui Wang <wangrui@loongson.cn>
Cc: loongarch@lists.linux.dev, WANG Xuerui <kernel@xen0n.name>, 
	linux-kernel@vger.kernel.org
Date: Sun, 09 Oct 2022 18:37:28 +0800
In-Reply-To: <CAAhV-H6e9ZyC8TkpWK3Etgz4-kEEEU4Hj=i5obMFk=URgCwrgw@mail.gmail.com>
References: <20221004140230.748788-1-wangrui@loongson.cn>
	 <CAAhV-H6e9ZyC8TkpWK3Etgz4-kEEEU4Hj=i5obMFk=URgCwrgw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2022-10-09 at 14:13 +0800, Huacai Chen wrote:
> Queued for loongarch-next, thanks.

> And fixes the concurrent modification issue of fast path for huge
> pages.
> This issue will occur in the following steps:
>=20
>    CPU-1 (In TLB exception)         CPU-2 (In THP)
> 1: Load PMD entry (HUGE=3D1)
> 2: Goto huge path
> 3:                                  Store PMD entry (HUGE=3D0)
> 4: Reload PMD entry (HUGE=3D0)
> 5: Fill TLB entry (PA is incorrect)

Is this issue causing problems in practice?  If true should we pick this
for loongarch-fixes and backport into 5.19 & 6.0 too?

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
