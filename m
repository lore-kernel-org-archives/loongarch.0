Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE3633C1
	for <loongarch@lists.linux.dev>; Wed, 12 Apr 2023 11:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1681297710;
	bh=ALuqxXkknpPb+XGh4R8O0PTpAo7fqkBau9qQsFBl8xE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Q3UzUbY44p7ukE1Tkt1fkkTKSZnCiVbjhMP40lTMU1NdYplbK/fbWmQFJ6h2N/WyC
	 ikBWXyKkCCsKSyIe65lIOvEXErMceOLdWGm6tvO549f1cZPL8zv58JIFG+zAPaD3/4
	 EDvANhuTMKwll7GZI+yYHGr98enV3ChBYfl+FAhM=
Received: from [192.168.124.11] (unknown [113.140.11.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 3CCC966212;
	Wed, 12 Apr 2023 07:08:29 -0400 (EDT)
Message-ID: <bf4bda7a88bd5f33bd3bdc7fc715bc24fa4add8f.camel@xry111.site>
Subject: Re: [PATCH v1 3/4] LoongArch: Use larch_insn_gen_break() for kprobes
From: Xi Ruoyao <xry111@xry111.site>
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>,  WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn
Date: Wed, 12 Apr 2023 19:08:21 +0800
In-Reply-To: <1681293901-24918-4-git-send-email-yangtiezhu@loongson.cn>
References: <1681293901-24918-1-git-send-email-yangtiezhu@loongson.cn>
	 <1681293901-24918-4-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2023-04-12 at 18:05 +0800, Tiezhu Yang wrote:
> -static inline bool insns_not_supported(union loongarch_instruction insn)
> +static inline bool insns_not_supported(u32 code)
> =C2=A0{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0union loongarch_instruction in=
sn;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0insn.word =3D code;
> +

I remember Xuerui disliked this change.  Maybe we can add
__attribute__ (__transparent_union__) [1] for union
loongarch_instruction instead?

[1]: https://gcc.gnu.org/onlinedocs/gcc/Common-Type-Attributes.html#index-t=
ransparent_005funion-type-attribute

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
