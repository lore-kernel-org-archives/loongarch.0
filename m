Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F13C25782A
	for <loongarch@lists.linux.dev>; Sun,  7 Jun 2026 04:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780807199; cv=none; b=kJ76TJJfNi8+/1JMnErS6NtNnbY+YAxNeHUf9Kv3Ha3pYBMkcvrRmKVvbZqiZoqPdvlN+XrZXSgRzxq9aG8sYe6EOXRSirNX7TJno/UA0L+ii15sm4nVj+OgRqAkNTg9Uzbj+Sp5ItiXho7KN/gNGQeBLdyJb9KtLWFqm/Olorw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780807199; c=relaxed/simple;
	bh=VcNKaqqZcJnK0TToZiB67scg6/wpQCafBoCXrhg/leU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cfBzYOOToZF1ShQTK8FwpgDNjlp0XMqQpGO+uxArViHzSRDJxPtT1dXmmZHZK99LD5cOL3WQNuvo96VYRav4WcCRibIMmGHtRF995tmGlr3050hynWu3I/7mbhbPBR7gOt1BTmARLm7VvUU2MhGpv8tkZq96YpLmyFDhIPbbmy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MM7j9NTT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MM7j9NTT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CDFE1F00898
	for <loongarch@lists.linux.dev>; Sun,  7 Jun 2026 04:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780807197;
	bh=Uh6WJk9zG45bNL9LzvNQsvjDMlkIgG8JZDRKRc8eD7E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MM7j9NTTIMcEoG5RWNmqd3I3Hc9K3u3ulDJi8q5foYgl5ywPTChl55s0kysrNAC1v
	 eGOTA/d8c8C5mJtLk1h6h1okMytY1Nz2mATdQxlo9e1Trrk3bLcI76dN14hd/VFpT4
	 krRC9+cz/EJU6J3a84b3beZqiKWGj8f8eIscHASVngD4PfKoTJ33JcAZq0WhV0q83z
	 erOoQmHDcXxBvnYAPZm6YmRMfuN5gJC63I7Z3cot4PoQv65/5GSmwJVG05mOD6KO6s
	 ezMt5pGZ4kNHTpVHVW4F8R0Z0Q4hcTDvUiTmOUga/OUkruOnHh1GTbjLUJOKYU4MzO
	 gW2cFjEu9KrHA==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso6166564a12.0
        for <loongarch@lists.linux.dev>; Sat, 06 Jun 2026 21:39:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8TavC46f7/pXUuHnpPKTpmft86efRh2FNtqLez6zFVr8ifs5ey69ImkgDac2XEmCEA67bezdS+KM4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCjeO1hQJNV/X/ADm3vCOhFz9KHOBSuXjhayqSBfQaeNGidBeb
	I70V3P8CFb/krB0LBNxXfXuvtkaVTsxfhYwzOyr3frnUWUgq8Otg1KRSVJMXEWni9M5qtaCYvzm
	T5u3Klzy98Lgnln049shIidi4v3DGzuo=
X-Received: by 2002:a05:6402:278f:b0:68f:cd4c:7296 with SMTP id
 4fb4d7f45d1cf-68ff22839a1mr3911134a12.13.1780807195663; Sat, 06 Jun 2026
 21:39:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260604090151.3254805-1-wangxuewen@kylinos.cn>
In-Reply-To: <20260604090151.3254805-1-wangxuewen@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 7 Jun 2026 12:39:44 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4++mQ4LHdE7_nG4xVQ5BuJm65HP9JVLgsk9x7_RGqh4A@mail.gmail.com>
X-Gm-Features: AVVi8CcYwIMlNW8bCP66fLE-He--kTI80oJ3jyUw6bNoIxIy9nzU_q8vuveqVCU
Message-ID: <CAAhV-H4++mQ4LHdE7_nG4xVQ5BuJm65HP9JVLgsk9x7_RGqh4A@mail.gmail.com>
Subject: Re: [PATCH v1] LoongArch/mm: Fix nr passing in set_direct_map_valid_noflush()
To: Xuewen Wang <wangxuewen@kylinos.cn>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Thu, Jun 4, 2026 at 5:02=E2=80=AFPM Xuewen Wang <wangxuewen@kylinos.cn> =
wrote:
>
> set_direct_map_valid_noflush() incorrectly passed 1 to __set_memory()
> instead of nr. This caused only the first page to be updated when nr > 1.
>
> Other architectures all pass nr correctly.
>
> Fixes: 0c6378a71574 ("arch: introduce set_direct_map_valid_noflush()")
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
> ---
>  arch/loongarch/mm/pageattr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/mm/pageattr.c b/arch/loongarch/mm/pageattr.c
> index f5e910b68229..614ccc7afccb 100644
> --- a/arch/loongarch/mm/pageattr.c
> +++ b/arch/loongarch/mm/pageattr.c
> @@ -234,5 +234,5 @@ int set_direct_map_valid_noflush(struct page *page, u=
nsigned nr, bool valid)
>                 clear =3D __pgprot(_PAGE_PRESENT | _PAGE_VALID);
>         }
>
> -       return __set_memory(addr, 1, set, clear);
> +       return __set_memory(addr, nr, set, clear);
>  }
> --
> 2.25.1
>
