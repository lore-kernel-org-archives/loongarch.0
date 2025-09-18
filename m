Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642BA1F1921
	for <loongarch@lists.linux.dev>; Thu, 18 Sep 2025 07:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758180488; cv=none; b=Wg2bPEJLPlv6cHTh/PDNTcEfXja/k8vKSzhFqQWsM4CANNqnJGndjRldYSlRrelZli+818g3uMAG2yAnZfD3IFGUQbpfbcjbbjOso1tstdV1/s+wDR0ELrjIVI3tr8x82F9M1VyHQ/+h4f65hq8BBHQmeyYM0nVND0mLC1wcfJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758180488; c=relaxed/simple;
	bh=M3qh+pwTnrgAehWqcHIeCu4RJqLURz4A6NKBLrXuJMA=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=B8h21WxDufSjJ0H0qrLom9lBC7RHoTt8DS622nno33NI7nIGA4/M5JSikoawNY5ssy8ENUDccDuMG4UBfdonXRlZlhdKNGVRvfcgTqvbG+ftiND5yuG5WyaU/rWhnReIkzWfknEwbjYznSSXmNUJhOfKF7F7DaZj3zqB+5LhZzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nDW19VjW; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nDW19VjW"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758180480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ylPW/E/h4fTKtpyWvYbq6Hdb+ataQjJxacvLPMAMfYE=;
	b=nDW19VjWQ1wZIxo6VQZIBwVEvss27QgtamZNsDYuYJfaJnhmJXJs+dRWlrKF+nHgF1KoHs
	mVWW8SevuUbVohe6o/JqqYZXjybV+knCIfhURFEuktfgmd2IoCHx0bY6qRpPuEisJQhthl
	ymRLE+5XJwWiHKMvPfNSo9ONSZA+BG0=
Date: Thu, 18 Sep 2025 07:27:58 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Jackie Liu" <liu.yun@linux.dev>
Message-ID: <59f762f22d964641fb67d4c72d91958270dd453c@linux.dev>
TLS-Required: No
Subject: Re: [PATCH 2/2] loongarch/env: fix missing NULL check after
 kstrdup()
To: "Huacai Chen" <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev
In-Reply-To: <CAAhV-H6G7eMFCEiF9fijiyFELMKv5s1hUy=HK9iCU7RPrp2AJA@mail.gmail.com>
References: <20250918064448.91647-1-liu.yun@linux.dev>
 <20250918064448.91647-2-liu.yun@linux.dev>
 <CAAhV-H6G7eMFCEiF9fijiyFELMKv5s1hUy=HK9iCU7RPrp2AJA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

Hi Huacai.


2025=E5=B9=B49=E6=9C=8818=E6=97=A5 15:15, "Huacai Chen" <chenhuacai@kerne=
l.org mailto:chenhuacai@kernel.org?to=3D%22Huacai%20Chen%22%20%3Cchenhuac=
ai%40kernel.org%3E > =E5=86=99=E5=88=B0:


>=20
>=20Hi, Jackie,
>=20
>=20Your partner has already sent a patch and be NAKed, don't you know?
>=20
>=20https://lore.kernel.org/loongarch/5169d057-28c9-439c-a6b7-1138b4f79e6=
5@xen0n.name/T/#t
>=20
>=20Huacai

Yes, I was just reviewing the code and happened to check this while
investigating other crash issues. It looks like passing NULL to strsep
won=E2=80=99t cause a crash, so this can safely be ignored. Thanks for po=
inting
it out.

---=20
Jackie=20Liu

>=20
>=20On Thu, Sep 18, 2025 at 2:45 PM Jackie Liu <liu.yun@linux.dev> wrote:
>=20
>=20>=20
>=20> From: Jackie Liu <liuyun01@kylinos.cn>
> >=20
>=20>  The result of kstrdup() may be NULL when memory allocation fails.
> >  In init_cpu_fullname(), the return value was used directly by strsep=
()
> >  without validation, which could lead to NULL pointer dereference.
> >=20
>=20>  Add a proper check for the kstrdup() result and return -ENOMEM whe=
n
> >  allocation fails.
> >=20
>=20>  Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
> >  ---
> >  arch/loongarch/kernel/env.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
>=20>  diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/e=
nv.c
> >  index c0a5dc9aeae2..b41a65ec45c3 100644
> >  --- a/arch/loongarch/kernel/env.c
> >  +++ b/arch/loongarch/kernel/env.c
> >  @@ -49,6 +49,8 @@ static int __init init_cpu_fullname(void)
> >  ret =3D of_property_read_string(root, "model", &model);
> >  if (ret =3D=3D 0) {
> >  cpuname =3D kstrdup(model, GFP_KERNEL);
> >  + if (!cpuname)
> >  + return -ENOMEM;
> >  loongson_sysconf.cpuname =3D strsep(&cpuname, " ");
> >  }
> >  of_node_put(root);
> >  --
> >  2.51.0
> >
>
