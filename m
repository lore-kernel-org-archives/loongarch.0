Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B422248B0
	for <loongarch@lists.linux.dev>; Thu, 18 Sep 2025 07:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758180252; cv=none; b=L6TsEawlWMkIKvKhd0+S5wy6VEQU+fd0zq+6M67tLWGy3/iSARswYzXng65m0AKyQ8M7PuUnjxlGfxfeR3gvoBSziHUeReM1di3OSURPjKs34ZiAJY2Jf7smNmCwalMWyFzm8xgppBFPAWGeo6KXyU8Uk7vwwWTS/GUSDFDCljU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758180252; c=relaxed/simple;
	bh=v2LpmB9ZpOaYRrG9J/kS7lnN2nF3otgutwrwtMeVNXM=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=fqRUODLui6xM6G1YIYkzmiQpo8JB86eVKOMl3lkn5EJ7lCRIivrLC8fpuabnoe3aJpQYcgEpy9WL54E+N1idB6VE2XR7s1bKgNHOIDH37b2uy3p9iOqQfaMTp/Tg3BTPoA5wJHlm71GUgezoXHsS/1l5i2u+FxVQrijfZWkG6to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tFXQwW+R; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tFXQwW+R"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758180247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DDgoqJpybK5r75jQHO1ehyCUZJLxpEjrWBh8T4tUnHU=;
	b=tFXQwW+RwoexKWOb+UaSEhl1TATOXVFQrbMAtRIimPaJfvH+PQkRBQCTNM2065ulQoG06y
	LH6z+CR5kOyZOUaFvtC6RZfAVTpfv48LeDIbMeZg+21UFB2y5yEmmnfdgzqG/4EmBMKZVk
	oU+PIZzVbx9L8itUp21N6M0Tn+Z0pGg=
Date: Thu, 18 Sep 2025 07:24:04 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Jackie Liu" <liu.yun@linux.dev>
Message-ID: <ce8e83a9ce71d412153d069c0b742917d7b33e11@linux.dev>
TLS-Required: No
Subject: Re: [PATCH 1/2] loongarch/vdso: add missing NULL check after
 kcalloc()
To: "Huacai Chen" <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev
In-Reply-To: <CAAhV-H62aEKNtwEjSnrxPSVuTzXS=eNmJ2+8fYRk3Q--V0mLig@mail.gmail.com>
References: <20250918064448.91647-1-liu.yun@linux.dev>
 <CAAhV-H62aEKNtwEjSnrxPSVuTzXS=eNmJ2+8fYRk3Q--V0mLig@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

2025=E5=B9=B49=E6=9C=8818=E6=97=A5 15:17, "Huacai Chen" <chenhuacai@kerne=
l.org mailto:chenhuacai@kernel.org?to=3D%22Huacai%20Chen%22%20%3Cchenhuac=
ai%40kernel.org%3E > =E5=86=99=E5=88=B0:

Hi Huacai

>=20
>=20Hi, Jackie,
>=20
>=20Someone has already sent a patch and be applied, don't you know?
>=20
>=20https://lore.kernel.org/loongarch/CAAhV-H6hTFrUO5gTx6FYo89TAouEykTvKp=
LNkqFfhtsg0PVLiw@mail.gmail.com/T/#t
>=20
>=20Huacai

Ah, I just checked Linus's tree, While looking into other
memory allocation failures, I took the chance to try fixing this as well.=
 Thanks
for pointing it out.

---=20
Jackie=20Liu

>=20
>=20On Thu, Sep 18, 2025 at 2:45 PM Jackie Liu <liu.yun@linux.dev> wrote:
>=20
>=20>=20
>=20> From: Jackie Liu <liuyun01@kylinos.cn>
> >=20
>=20>  The kcalloc() call in init_vdso() allocates memory for code_mappin=
g.pages,
> >  but its return value was not validated before use. This could cause
> >  NULL pointer dereference if allocation fails.
> >=20
>=20>  Add a check for the kcalloc() result and return -ENOMEM on failure=
.
> >=20
>=20>  Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
> >  ---
> >  arch/loongarch/kernel/vdso.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
>=20>  diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/=
vdso.c
> >  index 7b888d9085a0..088f8095210b 100644
> >  --- a/arch/loongarch/kernel/vdso.c
> >  +++ b/arch/loongarch/kernel/vdso.c
> >  @@ -53,6 +53,8 @@ static int __init init_vdso(void)
> >  vdso_info.size =3D PAGE_ALIGN(vdso_end - vdso_start);
> >  vdso_info.code_mapping.pages =3D
> >  kcalloc(vdso_info.size / PAGE_SIZE, sizeof(struct page *), GFP_KERNE=
L);
> >  + if (!vdso_info.code_mapping.pages)
> >  + return -ENOMEM;
> >=20
>=20>  pfn =3D __phys_to_pfn(__pa_symbol(vdso_info.vdso));
> >  for (i =3D 0; i < vdso_info.size / PAGE_SIZE; i++)
> >  --
> >  2.51.0
> >
>
