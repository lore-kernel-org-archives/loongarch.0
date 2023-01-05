Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E10A38
	for <loongarch@lists.linux.dev>; Thu,  5 Jan 2023 09:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0252BC433EF;
	Thu,  5 Jan 2023 09:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672911401;
	bh=m5deoU/iNE9s4Vf89FWDMooWeaxz9CcPD3sBSp186Jc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XAIF+O/OJ8hBrx0XzmPtDLuBUKq1L7we5ffh4nU0DiEwdYjDuZac51Wso30jJIXI7
	 7UdB+1Up/st73efB6kDy9jSKt8fsIjDDVW1luXjxGQ3tXjnpAZYc4ZwwQqwIW05Q4M
	 HhyiOXwyM4MouTVuSouy27QZk/drd+8Mt+sLauqQJLv5veN4qc2oGN/T/hG/UPoesC
	 qc4lK6AhHapx5A6VflLx01e6ATIAF1fvVZDoRGsHyPZv4lse8uVPpDZsPQPzfIgfaQ
	 qkr/QlxpgTMERkK/4vkOLDFNz0Gs03AYb1ySIb5XUJFd0DpUe7gUpK6NFfw+JSZaoB
	 idO9R04j1Pugw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: tong@infragraf.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.or, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org
Cc: Tonghao Zhang <tong@infragraf.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Hou Tao <houtao1@huawei.com>
Subject: Re: [bpf-next v2] bpf: drop deprecated bpf_jit_enable == 2
In-Reply-To: <20230105030614.26842-1-tong@infragraf.org>
References: <20230105030614.26842-1-tong@infragraf.org>
Date: Thu, 05 Jan 2023 10:36:38 +0100
Message-ID: <87zgaxqq55.fsf@all.your.base.are.belong.to.us>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tong@infragraf.org writes:

> diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
> index 737baf8715da..ff168c50d46a 100644
> --- a/arch/riscv/net/bpf_jit_core.c
> +++ b/arch/riscv/net/bpf_jit_core.c
> @@ -151,9 +151,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog =
*prog)
>  	}
>  	bpf_jit_build_epilogue(ctx);
>=20=20
> -	if (bpf_jit_enable > 1)
> -		bpf_jit_dump(prog->len, prog_size, pass, ctx->insns);
> -
>  	prog->bpf_func =3D (void *)ctx->insns;
>  	prog->jited =3D 1;
>  	prog->jited_len =3D prog_size;

Acked-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org> # RISC-V
