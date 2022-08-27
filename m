Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C3F15A0
	for <loongarch@lists.linux.dev>; Sat, 27 Aug 2022 04:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1661575310;
	bh=q+IArlEpqH3K0OESnbUSCutT/nF8iPeKxS4hKoZSRns=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=l79NVx+MukLMvGJg7tcyGcezWwlf9tBna2OAmZucrLhO2xX16/BgG1jxsXyPVbJm4
	 CJZ/iXP1Oy5Vy6L//Ure38cqukMCtgKzJgtbEtTR7B5pp3Es0HBkSPzu6kKAn+EyDu
	 yf9xpZoLvL7HrAsKUZ3lmnmr2MzpngBZOQw9oPMs=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 7285A66A06;
	Sat, 27 Aug 2022 00:41:47 -0400 (EDT)
Message-ID: <9b6f0aeaebbd36882b5b40d655f9ccd20c7be496.camel@xry111.site>
Subject: Re: [PATCH V3] LoongArch: Add efistub booting support
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, 
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-arch@vger.kernel.org, Xuefeng Li
	 <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, Xuerui Wang
	 <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Ard Biesheuvel
	 <ardb@kernel.org>, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 27 Aug 2022 12:41:45 +0800
In-Reply-To: <20220819102037.2697798-1-chenhuacai@loongson.cn>
References: <20220819102037.2697798-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.45.2 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Tested V3 with the magic number check manually removed in my GRUB build.
The system boots successfully.  I've not tested Arnd's zBoot patch yet.
--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
