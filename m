Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311927;
	b=GU7K4CIL3t+WrD3HBse7KerDuGUv4WH5bfOIgxSwx+U/4wTuPwWpkjqXvGRLtA5k+xbS
	 VEEdp+Kpj7BHZ4rvwtoTsSNzGczn10q1oq0plZRec7sSqbBgQlgt91O7tXkI78lVE8hUH
	 UgjRUiVWFxPbZCQOC/qRvz59VFy2QqYvVjsM5j+tZPKdhpd+TprEubXK37cTaLkJ43dR3
	 ypWVFVKCsGSSzJIhOoCXVwLZJ4V6qsSQ4e3FoK54rmVHKpGyQaGBwfoqA6Z5IdPFFb58P
	 yXt5B+R54N+JgIh41yXFSrEk68dlfFEHgdHhtyZWXd2jfp0saMuahlvqv705J8d1zoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311927;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8xrzXhTL0WVs+COqTlijJQelSK0Qwyr/ovJyC3RLEII=;
	b=PbumaVIsQt5pOc0p7g5sRCwgCqNhHOAtzKdDuDesSiq/uHmQ//h89Xcpy4/fG3v1cgGv
	 AOZXRmm2FT2cjcjZHFMkAg7GXGqXw0ofpnLQJw4/Vx7scqvrl76/LOQ4brXipoZNKgNho
	 LheoAvYZ+DfJQ73FBkghlfs3bR89KKnrB8ZIPb4Bam75WSpmFrqbdvTkAsf3zU9EqYAb1
	 +3/cwJQN8ssBNCrN+nHY/9xd0AyboSFL9opCfVtvSXhHwOb7wAOdu35/9HvK330Qq/Zsd
	 UmEOkTWHXx3yaBOCcOIEx5wC+PQyWWk4ke18jzU6Xxaeo2k1faEHQE+fVXCQ6YZtCyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=emMxNhtQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20A5606A331
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 11:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=emMxNhtQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 838FB1F008A5
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 11:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794311926;
	bh=8xrzXhTL0WVs+COqTlijJQelSK0Qwyr/ovJyC3RLEII=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=emMxNhtQXT6GeTvh+kRkYwEWLH00HiNJERy3KvUu1oP+Jo823ihfoYWMD4dWQ8b3E
	 D0PKYmvBaybuB0d57/MYtPdxyy4SiFEw5FXFGmhFYvVkK2RJtp3I1S9+mBSR/k3Dv3
	 f01ILM37j7MCQsznWJh+JlhOj+ohzsv472o4Gfozjnx2hkqfju4OIeFeP395+l3Qld
	 8p9rfS/OiakXatmNF4PYWIUBV24HVxbyvA5uW6jLZ1Z/FJv3ssc5ctzqjC9UByWLPY
	 21FQLvDjtxcBFETPHRDCV5rEnM/2XbOHpdgeqRG/ARr54N7RGDN8AILQE1zJbuSwWB
	 3Odo42VY0GyqQ==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d21051042so298814066b.0
        for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 03:58:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHRb0JSuu8pDvkRjcH8hK92mAgAjZUZvtizvtIDKm0mKocGpZ2tcBgZ0ldHV94ltcrrmHg6ZI4Osws=@lists.linux.dev
X-Gm-Message-State: APuU4Z9LlIsSxKeJr56+qW+Mpdgj767XYvwHT5Kl94tfocKjWgppEGPO
	aB5MMRqm8/OXnyxVqgHd3UUwMW3gs+xHIuWqwJhS0OwXoXa6NRsZHY+Cyued2y6KT7x8A0RZhN/
	TDRpACd7H3h4Ps5JELso2PCOU/PdS6Vw=
X-Received: by 2002:a17:906:3f97:b0:c46:8909:963b with SMTP id
 a640c23a62f3a-c5049548348mr132813666b.9.1794311925102; Tue, 10 Nov 2026
 03:58:45 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110084613.2746641-1-maobibo@loongson.cn>
In-Reply-To: <20261110084613.2746641-1-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 10 Nov 2026 19:58:33 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6DetSReoZviN_JuJzuzs9ZvUxXg9UXqKg-nfCu-+eRWQ@mail.gmail.com>
X-Gm-Features: AclHuK84cDWlYHFN5XyFvyk3vWEarUjoMDQprQZIFAhcunkS7NK99kky2uOcYIo
Message-ID: <CAAhV-H6DetSReoZviN_JuJzuzs9ZvUxXg9UXqKg-nfCu-+eRWQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] ACPI: LoongArch: Fix IOVT table parsing and add
 checksum validation
To: Bibo Mao <maobibo@loongson.cn>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, 
	Pawel Chmielewski <pawel.chmielewski@intel.com>, Len Brown <lenb@kernel.org>, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
	lixianglai@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Tue, Nov 10, 2026 at 4:46=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
> In acpi_iovt_init(), hdr is already a pointer, so passing &hdr is
> incorrect. Pass hdr directly instead.
>
> Also add checksum calculation/validation for the IOVT table.
>
> Bibo Mao (2):
>   ACPI: LoongArch: Fix incorrect pointer argument in acpi_iovt_init()
>   ACPI: LoongArch: Add checksum support with IOVT table
>
>  drivers/acpi/loongarch/iovt.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
>
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> --
> 2.39.3
>
>
