Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAF0A47
	for <loongarch@lists.linux.dev>; Tue, 21 Feb 2023 04:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1676954221;
	bh=lefJq0PkABiE40hGP+cE8pG5V0Ru6IiPZz+2dOAh2DQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YYIpv6zJsqWzhdbfWvspbND955SnKSHHFRLw8GOhYDEntWPuWp0L+FW3BNKyhpLp8
	 tjQuqncIr+DGVWcPhVYOI7rQFoMxbie6E3hL+87kmR7kFjtselhdw478SZHkQVKeB0
	 /+2K8kPoxKsM5m7PzpEw7bx2ugJBGTfv7ArXjHII=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 9559265C4D;
	Mon, 20 Feb 2023 23:36:59 -0500 (EST)
Message-ID: <ef024d7e4e0207e76c165c1818d1bb21f07235ab.camel@xry111.site>
Subject: Re: [PATCH v2 01/29] LoongArch: KVM: Add kvm related header files
From: Xi Ruoyao <xry111@xry111.site>
To: Tianrui Zhao <zhaotianrui@loongson.cn>, Paolo Bonzini
 <pbonzini@redhat.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org,  kvm@vger.kernel.org, Jens Axboe
 <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,  Alex Deucher
 <alexander.deucher@amd.com>, Oliver Upton <oliver.upton@linux.dev>,
 maobibo@loongson.cn
Date: Tue, 21 Feb 2023 12:36:58 +0800
In-Reply-To: <20230220065735.1282809-2-zhaotianrui@loongson.cn>
References: <20230220065735.1282809-1-zhaotianrui@loongson.cn>
	 <20230220065735.1282809-2-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2023-02-20 at 14:57 +0800, Tianrui Zhao wrote:

/* snip */

> +/*
> + * for KVM_GET_FPU and KVM_SET_FPU
> + */
> +struct kvm_fpu {
> +	__u32 fcsr;
> +	__u32 none;
> +	__u64 fcc;    /* 8x8 */
> +	struct kvm_fpureg {
> +		__u64 val64[4];	//support max 256 bits
> +	} fpr[32];

Do we need __attribute__((__aligned__(16))) for fpureg (like
sc_extcontext in struct sigcontext)?

> +};
> +
> +/*
> + * For LOONGARCH, we use KVM_SET_ONE_REG and KVM_GET_ONE_REG to
          ^^^^^^^^^
          LoongArch

> access various
> + * registers.=C2=A0 The id field is broken down as follows:
> + *
> + *=C2=A0 bits[63..52] - As per linux/kvm.h
> + *=C2=A0 bits[51..32] - Must be zero.
> + *=C2=A0 bits[31..16] - Register set.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
