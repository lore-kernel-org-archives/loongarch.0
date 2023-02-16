Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DE220FB
	for <loongarch@lists.linux.dev>; Thu, 16 Feb 2023 07:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1676531430;
	bh=TsE+n/Oc5hYelVsbzKQ1JUPsUBekojKKctblhehKKGg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=THamgp0kUdvskbpBPu6AXZt5CFuxGq3yDqsTzFQA9CAaoimF9QrKG3JtsR2iVwV3T
	 XmbEnKdUEN2QNUT+5wCjWRoh86eXRdxVMZ6Zdii2P2CnP+v5j6yb14bW6Ad5VdHln0
	 wtmbqzCfXuYeh2V36sF43UPQVsEEsMbE9hDt7wI4=
Received: from [IPv6:240e:456:1110:184c:aae9:7adc:b609:19e9] (unknown [IPv6:240e:456:1110:184c:aae9:7adc:b609:19e9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 004A565CE1;
	Thu, 16 Feb 2023 02:10:23 -0500 (EST)
Message-ID: <48c4b1f81c21950e9fd46d4acb5196d979b147cb.camel@xry111.site>
Subject: Re: [PATCH v4 2/5] LoongArch: Use la.pcrel instead of la.abs for
 exception handlers
From: Xi Ruoyao <xry111@xry111.site>
To: Jinyang He <hejinyang@loongson.cn>, Youling Tang
 <tangyouling@loongson.cn>,  Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, Jianmin
 lv <lvjianmin@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>
Date: Thu, 16 Feb 2023 15:10:17 +0800
In-Reply-To: <5adf0fc4-b75c-f7f2-311c-0f5d8f14311b@loongson.cn>
References: <1676018856-26520-1-git-send-email-tangyouling@loongson.cn>
	 <1676018856-26520-3-git-send-email-tangyouling@loongson.cn>
	 <CAAhV-H4Bs5n_ek3mq6zwxAgVw0nvER1XUA+WUA8M12eKcYVPDQ@mail.gmail.com>
	 <05ef2d91-ab87-b8d9-85fa-6a90a92f8f39@loongson.cn>
	 <848e2985-9ba3-c14d-23ac-a7f1c218215f@loongson.cn>
	 <5adf0fc4-b75c-f7f2-311c-0f5d8f14311b@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2023-02-16 at 14:59 +0800, Jinyang He wrote:
> +.macro la.abs reg, sym
> +766:
> +=C2=A0=C2=A0=C2=A0 nop
> +=C2=A0=C2=A0=C2=A0 nop
> +=C2=A0=C2=A0=C2=A0 nop
> +=C2=A0=C2=A0=C2=A0 nop

In the "formal" version we can code

lu12i.w		reg, 0
ori		reg, reg, 0
lu32i.d		reg, 0
lu52i.d		reg, reg, 0

here.  Then we only need to fixup the immediate slot so we can avoid
using parse_r.


> +=C2=A0=C2=A0=C2=A0 .pushsection ".laabs", "aw", %progbits
> +768:
> +=C2=A0=C2=A0=C2=A0 .word 768b-766b
> +=C2=A0=C2=A0=C2=A0 parse_r regno, \reg
> +=C2=A0=C2=A0=C2=A0 .word regno
> +=C2=A0=C2=A0=C2=A0 .dword \sym
> +=C2=A0=C2=A0=C2=A0 .popsection
> +.endm

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
