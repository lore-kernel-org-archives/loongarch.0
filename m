Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DB423A9
	for <loongarch@lists.linux.dev>; Sun,  6 Nov 2022 10:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1667729756;
	bh=/Sv1JuRQzp3rQX3xgsG5i3Ukgn1al9jABbd6jx0bnwI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=g62nqPZZxP8+CMW+5KU+nvyDCCijGG46DufyvLzzTfOpUg9mfJv7J0WdxOCmj0JIe
	 KNDnZB4zxpGKR/KgbcRa8uHIFxxYRjhjhs1A2dNF0IwNZnFZ4CPLjsA+ueVzvcB27O
	 rUvFruiGbYuMAFLKqD7EcLvnp2MrKlyeMt+hjnxw=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 4AE6465A9C;
	Sun,  6 Nov 2022 05:15:54 -0500 (EST)
Message-ID: <95a90f588b9193ee0f9895fbf238828a3dbbe958.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: Support booting with FDT from efi system
 table
From: Xi Ruoyao <xry111@xry111.site>
To: WANG Xuerui <kernel@xen0n.name>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Ard Biesheuvel <ardb@kernel.org>,  Jianmin Lv <lvjianmin@loongson.cn>
Cc: loongarch@lists.linux.dev
Date: Sun, 06 Nov 2022 18:15:52 +0800
In-Reply-To: <ac5f393a-be3c-3cd2-4738-b0537bc6e84e@xen0n.name>
References: <20221106065619.2543121-1-zhoubinbin@loongson.cn>
	 <ac5f393a-be3c-3cd2-4738-b0537bc6e84e@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2022-11-06 at 17:15 +0800, WANG Xuerui wrote:
> And, although we're already aware of the part-UEFI and part-FDT usage=20
> pattern, and the arch UEFI code already has consideration for such, it
> still makes me a bit wary because you risk losing standards compliance
> and creating maintenance burden for admins/users/devs alike by relying
> on this not-really-UEFI-but-advertising-as-such thing. I'd still suggest=
=20
> you try throwing together something fully DT, to at least experiment a
> little with. You already have to rewrite pretty much everything with all=
=20
> the boot protocol changes in the past few months, so this would probably=
=20
> not even hurt, and the burden on the LoongArch/generic UEFI infra could=
=20
> be lessened even further if this plays out. And you can always continue=
=20
> working on this change if it turns out infeasible to do so.

AFAIK using UEFI with FDT (instead of ACPI) is fully allowed and
documented by the standard (section 4.6.1.3 of the UEFI spec).  It may
be not possible or not worthy to implement ACPI for 2K systems, then FDT
will be the only choice.

In ARM64=C2=A0ecosystem, SBBR (for server) demands UEFI+ACPI, EBBR (for
embedded) allows UEFI+ACPI or UEFI+FDT.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
