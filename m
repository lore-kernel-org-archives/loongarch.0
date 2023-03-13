Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0713F23A7
	for <loongarch@lists.linux.dev>; Mon, 13 Mar 2023 10:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0516C4339C
	for <loongarch@lists.linux.dev>; Mon, 13 Mar 2023 10:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678701617;
	bh=fbmby0jK3o9esgZAXhEtKAqf/P42qKsJfHNH8wihVLk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KPpfzdDglMSNO3KezAmwjddzsekIznGvrHHdTJGz9Y2UDD+cxGkO048PPQzijKL5q
	 H9OACQbMSpwunBznshjPIWXpG4DYAfd8yCtJKbq8IyaV4VQM8Pw+eHYgRjvTFWdu+f
	 f3+39UR5agin+zxe+SSTkVWD5xKzGG+k6NiUclBtUwyCAWKG8JxfoNbJQRRb+/AM7t
	 j2sz8PrBE35SqOios8bw9CY4AkEiYOlcOnCziKbc3pn3d1Zj5/WcefkECh+1rJ4/yQ
	 LbkZVO0PakqRsX3OfGWuaeMgpq3ZZqn2fEkInSSd0XlrJWPeqfycc0nQntNyiIah5u
	 N2jFdmk2m9Bhg==
Received: by mail-lj1-f171.google.com with SMTP id y14so11984267ljq.4
        for <loongarch@lists.linux.dev>; Mon, 13 Mar 2023 03:00:17 -0700 (PDT)
X-Gm-Message-State: AO0yUKXld8/SsvGeop3c+vGqA9VqKpcRFy8kjU/lfnKB/A75+lBlHRKo
	twFfJAklw9Fm0q4FK6Sw4xta36ms2OORMdR1Kq4=
X-Google-Smtp-Source: AK7set+CYAWcAggcfZBV/DcUpV19dEieGqB4orxVaybAx6VW3CBUFV6CT9DH+7wo0t+D+aYsUZkdVAJfvHi0/sOB5gc=
X-Received: by 2002:a05:651c:11c6:b0:295:d460:5a2d with SMTP id
 z6-20020a05651c11c600b00295d4605a2dmr10418442ljo.2.1678701615664; Mon, 13 Mar
 2023 03:00:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230313081432.3769496-1-ardb@kernel.org> <CAMj1kXFBB9DK_zNL2h2=5-8P+VzOO=K1SgJ+07C55zbZoMHRLw@mail.gmail.com>
In-Reply-To: <CAMj1kXFBB9DK_zNL2h2=5-8P+VzOO=K1SgJ+07C55zbZoMHRLw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 13 Mar 2023 11:00:04 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGFb+0-e_t+LeRSJzqweU=SL98cfFnem625PGjjuGCv0A@mail.gmail.com>
Message-ID: <CAMj1kXGFb+0-e_t+LeRSJzqweU=SL98cfFnem625PGjjuGCv0A@mail.gmail.com>
Subject: Re: [PATCH] efi: libstub: Use relocated version of kernel's struct screen_info
To: linux-efi@vger.kernel.org
Cc: loongarch@lists.linux.dev, Xuefeng Li <lixuefeng@loongson.cn>, 
	Xuerui Wang <kernel@xen0n.name>, loongson-kernel@lists.loongnix.cn, 
	Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Mar 2023 at 09:48, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Mon, 13 Mar 2023 at 09:14, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > In some cases, we expose the kernel's struct screen_info to the EFI stub
> > directly, so it gets populated before even entering the kernel.  This
> > means the early console is available as soon as the early param parsing
> > happens, which is nice. It also means we need two different ways to pass
> > this information, as this trick only works if the EFI stub is baked into
> > the core kernel image, which is not always the case.
> >
> > Huacai reports that the preparatory refactoring that was needed to
> > implement this alternative method for zboot resulted in a non-functional
> > efifb earlycon for other cases as well, due to the reordering of the
> > kernel image relocation with the population of the screen_info struct,
> > and the latter now takes place after copying the image to its new
> > location, which means we copy the old, uninitialized state.
> >
> > So let's ensure that alloc_screen_info() produces the correct
> > screen_info pointer, by keeping its relocated address in a global
> > variable.
> >
> > Cc: loongarch@lists.linux.dev
> > Cc: Xuefeng Li <lixuefeng@loongson.cn>
> > Cc: Xuerui Wang <kernel@xen0n.name>
> > Cc: loongson-kernel@lists.loongnix.cn
> > Reported-by: Huacai Chen <chenhuacai@loongson.cn>
> > Link: https://lore.kernel.org/linux-efi/20230310021749.921041-1-chenhuacai@loongson.cn/
> > Fixes: 42c8ea3dca094ab8 ("efi: libstub: Factor out EFI stub entrypoint into separate file")
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>
> This is still not working :-(
>

Huacai, could you try this patch please? It is working now - I don't
know what I did wrong before when testing it.
