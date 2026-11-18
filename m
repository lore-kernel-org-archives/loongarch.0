Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987402;
	b=5FAssg3phy4UAgyG5kBg/GWLtoR5Dw6Lj+BABnnI2ijxOuhZRgPdS5cQZk7wL1TYyTET
	 RkQEA0E2VVus4nxomUdQA9weGoNYZdMa1RSMawU3FMMVKYewaPC/tN1PxV4XkYHpDUPvA
	 O+XCmhEVhrKfWY/4l+1g24GygnY8n4eMKHlNZBG43iHzqO2gdzsPSCTWB81gg8q78xOhm
	 HS7dpBxxA9wIX4bS3SKWSFKxOzqZrRSEjB4NncINTOxctcnaQu5Er5FEUb4rRhk89eLdZ
	 YC6N7D0WHwc9edSMIpwby1ylC2IrpTMYTgf/G2ti8V93HCNtBeBFI8uNJbKTfSmdLLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987402;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=3bQUkTtQtFHtNT717eq7Cz4Y5/0ywVBOTDLcqCWHl/g=;
	b=4nC/oghxJde8Md0QVXN8T2tbfgKZvl/ZXmKIyIdrHdHiOclXWtlpa2EHLU0RBAFTnJdZ
	 XxxRgXnHrsaQAew3MNjm00tjwFUUjwduh7d8Zk1Kccmmc99uQ1b9EDGIMYw16UN7I/AGD
	 hLTZ1UUaAOY6AT9947fJLd3djjC0l+x9guxrn+c1e0+m05vKOf3a/5OQSW8aLHzOcdBu4
	 j0ewBoAWIDq3XWp5mGyN+os3Y3me8bGsNMkY/jos8oBndhCTqjGBXM2Qd1WIpK6siJGZt
	 /pqjnxRf7wMJhVHI7+TZkiyyhm+mFSERinRFT+/RVZIBPe2ZsecZNTVy+fVuP5jnSyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UlUVR8Lb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F20606A31C
	for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 07:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UlUVR8Lb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CCE1F000C5
	for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 07:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794987402;
	bh=3bQUkTtQtFHtNT717eq7Cz4Y5/0ywVBOTDLcqCWHl/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UlUVR8Lb92kBC1DwaybFFuN4+9DOao0o8SXKRFLvyFXQA5hSHmiRFervy/P/BZbk/
	 Ji1VyuGzQP64IBTwS7ObTW+cSnyWLGCDHACLY/EX4Ld2yzBMtSubE/qAbjmjucZOCt
	 vCnTQnls8Sv7TnFV0ha4tqHoGwD+pqLiXPJp+gzAnZrt0OKmPVoKTehog2bqbphVdv
	 fpRXHt53HrOrPgq5njmDLVVHnUBgVrQZN1EFS10dob34BNaB8C/ruQXEifA14qJg57
	 ZVM4EkdFYPeKNMqj5i1D9UHVfG8pKx9HD7M6kOaihHjIYtzxXT6Ocp5jfw0ewnAUOa
	 7a6DyMUROBHgg==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b87a92c17eso1133656a12.3
        for <loongarch@lists.linux.dev>; Tue, 17 Nov 2026 23:36:42 -0800 (PST)
X-Gm-Message-State: APuU4Z8eCR0efhUcvehdGU0NkMtt7EK9q54r1/sCwA9JuhWBvU8L42i+
	pXo2CzWfnDjwPMQHoMK3HcdMmwd6FmjHVWHoaVpY2vSDNBggSgooXoXZW1L0zS2sOHnqB/CQ2/h
	KMmdnMj+9SFzNk4oFUblUOWZv9hfkZBw=
X-Received: by 2002:a05:6402:1598:b0:6b6:e808:9711 with SMTP id
 4fb4d7f45d1cf-6b887eed9a7mr1089834a12.29.1794987401013; Tue, 17 Nov 2026
 23:36:41 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115193107.571674-1-hanbings@hanbings.io>
In-Reply-To: <20261115193107.571674-1-hanbings@hanbings.io>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 18 Nov 2026 15:36:31 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6ww3dObKa3zNxj4jv7JWoB_fukX+b-HYnb_31_=sPbEw@mail.gmail.com>
X-Gm-Features: AclHuK_D_Un9lgED40yjZJGpoQ-aah58o4T7MJlx8H1GjYPfzxP6N8z6Qn2PuhM
Message-ID: <CAAhV-H6ww3dObKa3zNxj4jv7JWoB_fukX+b-HYnb_31_=sPbEw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix off-by-one in bt_address() exception
 vector check
To: hanbings <hanbings@hanbings.io>
Cc: loongarch@lists.linux.dev, WANG Xuerui <kernel@xen0n.name>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

What's your opinion?

Huacai

On Mon, Nov 16, 2026 at 3:31=E2=80=AFAM hanbings <hanbings@hanbings.io> wro=
te:
>
> EXCCODE_INT_END names the last valid interrupt exception code, not an
> exclusive upper bound.  Since INT_AVEC is 14:
>
>     EXCCODE_INT_NUM =3D INT_AVEC + 1 =3D 15
>     EXCCODE_INT_END =3D EXCCODE_INT_START + EXCCODE_INT_NUM - 1 =3D 78
>
> trap_init() installs handle_vint for vectors 64 through 78 inclusive,
> and the switch in bt_address() also maps types up to EXCCODE_INT_END
> inclusive.  But the range check uses:
>
>     ra < eentry + EXCCODE_INT_END * VECSIZE
>
> which stops at the start of vector 78, so an address in the last
> interrupt vector is never translated.  For example, eentry + 78 *
> VECSIZE + 0x154 is rejected instead of being mapped to handle_vint +
> 0x154.
>
> The off-by-one has existed since the ORC unwinder was added; at that
> time EXCCODE_INT_END was 77, so vector 77 was excluded.  After AVEC
> support made vector 78 the last interrupt vector, vector 78 is the one
> that is excluded.  Before commit 4cd641a79e69 ("LoongArch: Remove
> unnecessary checks for ORC unwinder"), this silently ended the unwind.
> Since that commit, bt_address() returns 0 and unwind_next_frame()
> logs:
>
>     cannot find unwind pc at ...
>
> Fixes: cb8a2ef0848c ("LoongArch: Add ORC stack unwinder support")
> Cc: stable@vger.kernel.org
> Signed-off-by: hanbings <hanbings@hanbings.io>
> ---
>  arch/loongarch/kernel/unwind_orc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/u=
nwind_orc.c
> index 9cfb5bb19..784edf6a7 100644
> --- a/arch/loongarch/kernel/unwind_orc.c
> +++ b/arch/loongarch/kernel/unwind_orc.c
> @@ -366,7 +366,7 @@ static inline unsigned long bt_address(unsigned long =
ra)
>         }
>  #endif
>
> -       if (ra >=3D eentry && ra < eentry +  EXCCODE_INT_END * VECSIZE) {
> +       if (ra >=3D eentry && ra < eentry + (EXCCODE_INT_END + 1) * VECSI=
ZE) {
>                 unsigned long func;
>                 unsigned long type =3D (ra - eentry) / VECSIZE;
>                 unsigned long offset =3D (ra - eentry) % VECSIZE;
>
> base-commit: 422e532809572ba1043192bf6a0c653bc68b3140
> --
> 2.54.0
>
>
