Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECCA28C2DD
	for <loongarch@lists.linux.dev>; Thu, 20 Nov 2025 08:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763626077; cv=none; b=MspZUeiJ3c8r4/CyYDnlTSmXzyDzDSRR/FjjXVywzFKNwSNgj6jyTQwcJeq1QIYFRJaEyow3RkA5vadzP/qFg8/jDduwMrZQiaBdAaStsAdTvESVSccWGmYRTzNyeLQRY7N/HpvRFax8ywmfGvSLEb3juS+w05frT1Mc2pZiuaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763626077; c=relaxed/simple;
	bh=S2zD5GWnzzMaSZzsU+uYgmeZUPebxQ3FwcwclHQ17hM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UJQTgIPOikGR1+5P3nXinASFfowLAHK+8H5D1aujfqZUcx1hqbprJypp8fTPkuee4FW6chPzparRVrZpJ3+1+D14oQ3XpUHiHFhrqRa8wOamYGu101UDw33FcRoi0y3ZESlSwIjcHnW1XilknJG1zSu4iuvfgvhUGWe/8jraZvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=VBpxOQfo; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="VBpxOQfo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1763626065;
	bh=/iYILqBoePyqDGwdqKJDJZ5G3N9q3wiB+HVdMuICQJY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=VBpxOQfopBQiOUblXYQuJE5+OMW8NLh+dyxJHxsL1Ei0FP59evAtRXlEk6Xtm8W8e
	 XvQCS3qDWWi1NnOPwf+NuA4HJjV8MOYsNcnxTL2Sf/JnvbpId06WvBH4h9GMAqj62B
	 QmZwbAaK+Yto+OTnxCf97jn5WGvjAI0d8YHFGV/0=
Received: from [127.0.0.1] (2607-8700-5500-e873-0000-0000-0000-1001.16clouds.com [IPv6:2607:8700:5500:e873::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 32A10661C6;
	Thu, 20 Nov 2025 03:07:44 -0500 (EST)
Message-ID: <18b8122d45931e1d84565887f99b76667021d893.camel@xry111.site>
Subject: Re: [PATCH 1/2] LoongArch: Add 128-bit atomic cmpxchg support
From: Xi Ruoyao <xry111@xry111.site>
To: George Guo <dongtai.guo@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
  WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, George Guo
	 <guodongtai@kylinos.cn>
Date: Thu, 20 Nov 2025 16:07:42 +0800
In-Reply-To: <20251120-2-v1-1-705bdc440550@linux.dev>
References: <20251120-2-v1-0-705bdc440550@linux.dev>
	 <20251120-2-v1-1-705bdc440550@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2025-11-20 at 15:45 +0800, George Guo wrote:
> From: George Guo <guodongtai@kylinos.cn>
>=20
> Implement 128-bit atomic compare-and-exchange using LoongArch's
> LL.D/SC.Q instructions.
>=20
> At the same time, fix BPF scheduler test failures (scx_central scx_qmap)
> caused by kmalloc_nolock_noprof returning NULL due to missing
> 128-bit atomics. The NULL returns led to -ENOMEM errors during
> scheduler initialization, causing test cases to fail.
>=20
> Verified by testing with the scx_qmap scheduler (located in
> tools/sched_ext/). Building with `make` and running
> ./tools/sched_ext/build/bin/scx_qmap.
>=20
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
> =C2=A0arch/loongarch/include/asm/cmpxchg.h | 46 +++++++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 46 insertions(+)
>=20
> diff --git a/arch/loongarch/include/asm/cmpxchg.h b/arch/loongarch/includ=
e/asm/cmpxchg.h
> index 979fde61bba8a42cb4f019f13ded2a3119d4aaf4..5f8d418595cf62ec3153dd382=
5d80ac1fb31e883 100644
> --- a/arch/loongarch/include/asm/cmpxchg.h
> +++ b/arch/loongarch/include/asm/cmpxchg.h
> @@ -111,6 +111,43 @@ __arch_xchg(volatile void *ptr, unsigned long x, int=
 size)
> =C2=A0	__ret;								\
> =C2=A0})
> =C2=A0
> +union __u128_halves {
> +	u128 full;
> +	struct {
> +		u64 low;
> +		u64 high;
> +	};
> +};
> +
> +#define __cmpxchg128_asm(ld, st, ptr, old, new)				\
> +({									\
> +	union __u128_halves __old, __new, __ret;			\
> +	volatile u64 *__ptr =3D (volatile u64 *)(ptr);			\
> +									\
> +	__old.full =3D (old);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +	__new.full =3D (new);						\
> +									\
> +	__asm__ __volatile__(						\
> +	"1:=C2=A0=C2=A0 " ld "=C2=A0 %0, %4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 # 128-bit cmpxchg low=C2=A0 \n"	\
> +	"=C2=A0=C2=A0=C2=A0=C2=A0 " ld "=C2=A0 %1, %5=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # 128-bit cmpxchg high \n"	\

This is incorrect.  It may happen that:

      SMP 1        |        SMP 2
ll.d $r4, mem      |
                   |   sc.q $t0, $t1, mem
ll.d $r5, mem + 4  |

As the second ll.d instruction raises the LL bit, you lose the info if
the first ll.d instruction has succeeded.  Thus you cannot figure out if
someone has modified the mem during your "critical section."

You should use a normal ld.d for the high word instead.  And you need to
insert a dbar between ll.d and ld.d to prevent reordering.

--=20
Xi Ruoyao <xry111@xry111.site>
