Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB57512B9B
	for <loongarch@lists.linux.dev>; Sat, 16 Sep 2023 10:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1694859630;
	bh=iAYuSgDOA9caU3I0eEAZttOP6Ne6ugH+0cwpSNDzdms=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=mU1ZZoYzx/9XgXN0F9K+2cPlA8LkQPdmq3MOGtGIRVACZaBedTR89H/bVQkPvLCFF
	 UYvsjJN/PKLAl+ofDEnIIxxbw4uDDCMD1S20/CdBfeWG04TtsHQ0sVsj2wlaELPMVG
	 /fVXEUdV6Kj2XzNWWHhRmuQkRJBYS+iYQBG5IoMA=
Received: from [127.0.0.1] (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 08FCE659AC;
	Sat, 16 Sep 2023 06:20:28 -0400 (EDT)
Message-ID: <72f7104b8097d5f894f069528a0e1a2b0f7e210d.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: Fix some build warnings with -W1 option
From: Xi Ruoyao <xry111@xry111.site>
To: bibo mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Sat, 16 Sep 2023 18:20:27 +0800
In-Reply-To: <4597fd85-8aff-fb6f-295b-e5b4b3ac092e@loongson.cn>
References: <20230916092330.971630-1-maobibo@loongson.cn>
	 <CAAhV-H50_aY8Sw0uPSs1VuNOtbaHF2-a5mZE2jnSC7QPUaWf=Q@mail.gmail.com>
	 <1918be3c-3560-bd3d-6518-c5e49319b1d6@loongson.cn>
	 <c71c610d70727b94dfaa1bdd537235cde13db7c6.camel@xry111.site>
	 <4597fd85-8aff-fb6f-295b-e5b4b3ac092e@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2023-09-16 at 18:17 +0800, bibo mao wrote:
> > What is a -W1 option?=C2=A0 At least GCC 13 does not recognize it.
> >=20
> > And generally you cannot randomly add warning options building the
> > kernel and expect a clean result.=C2=A0 I don't think we should "fix"
> > breakages caused by custom warnings at all, unless the warning indicate=
s
> > a real issue.
> it is W=3D1 option:), and it is reported by lkp tool like this:

Get it, then the subject should just say "W=3D1" instead of "-W1".

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
