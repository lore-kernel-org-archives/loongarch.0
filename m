Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9366830E0EE
	for <loongarch@lists.linux.dev>; Fri, 28 Nov 2025 14:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764340069; cv=none; b=iw6HUw/GEygoyhr7x+v4QPLHJgCSjy6pWvQxEhn4QM7bwkPEIZbgWO/OJVPb/PlFYcN0JN9xRJl+yiw62ObWALDZpU0IR0y6qOHYq+0j32FjofS0xjwloVWXRfapCcLvUxs4iUbSbqgySYyFSCl41dL9fY68AJiCyg9CIIQsesE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764340069; c=relaxed/simple;
	bh=TIlLCCXmNkKQ6UHYT9hpCx2OhqWR4OWSdmF2Aj6Gx+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LHS2zwM2/dLnELzqat8lTgFAdii4liEo5NVHZIJMDWD/H8v5KST42pfYMvvgiY/tbQEKGMGQGwhhawGfCj747ZiBfAc0ToOjioAQuw7sX5SIGSmZYtGK91o+X8I02hm5K4kG0bkrD7cGyuG6E1F9jMUcaIm3x/SdoSCCPmi1xhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bs13G+pv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bs13G+pv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F36CEC4AF09
	for <loongarch@lists.linux.dev>; Fri, 28 Nov 2025 14:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764340069;
	bh=TIlLCCXmNkKQ6UHYT9hpCx2OhqWR4OWSdmF2Aj6Gx+Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bs13G+pvEXOLEVD/XfjGAIgRw1a/8reaqzsiKHRbbJuRXFDhog80YX0mzyXEvy1RB
	 TvXxlos1XBHDK7pUbpe8hOSZeww6CEUP4fYDRq8EHhX9O+QwN71StSP4X3rHapDJND
	 3LhIXoJU7zy/fQL/4MS+7f7ms5utccAvUoM/XkW2l3hXuSUoUY8c4b942I/Zxt+JU6
	 OKrU27WpXmJxqWwMEJeFURj5Mg+jJ1v9jnR5Iy2hVmLR6aKIace7LIjh8XYBrtsAMq
	 lOS18NRw16KpuYTZttZBpL9YDKm8jBAHcgszf2VuKrWiLF6sPuiPo8j3cEALtlSo76
	 eZHa0QwY+Tgbg==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b73a9592fb8so518011166b.1
        for <loongarch@lists.linux.dev>; Fri, 28 Nov 2025 06:27:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXSxcLNycHLX3f5KpxRDrX35fQ4JHkf2BaGeBDDpqsDmGuAXW4TQlCzcg6FSnkvoTtZg98sAq97EJA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAT37+XKp0Z4yx9QXbLGFwN257UFGCUkqXcqachTFOcAb0qhUh
	IIqli2emyzPMQHg2uVn4zd2iLK9h43kivmZ94CAvVwq17e7GHY/6v9JXU3CM8NwBAbQHCBhgbO7
	7bXgYoJCbcg2eOCzyfknFF7U4KDdBzsY=
X-Google-Smtp-Source: AGHT+IGJJaDWZwL5sINsPioZz2L9Li3w7MZK5U34JG97O+rf3rLxkEekRPFol/PhF/Lqt6sLriTGdmAEMGcBElLfocM=
X-Received: by 2002:a17:906:ee8d:b0:b70:d1ea:2748 with SMTP id
 a640c23a62f3a-b7657172ed1mr4013389166b.11.1764340067546; Fri, 28 Nov 2025
 06:27:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251127154832.137925-1-chenhuacai@loongson.cn>
 <20251127154832.137925-15-chenhuacai@loongson.cn> <12520d82-d858-4067-b9ef-baddb596ee56@app.fastmail.com>
In-Reply-To: <12520d82-d858-4067-b9ef-baddb596ee56@app.fastmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 28 Nov 2025 22:27:48 +0800
X-Gmail-Original-Message-ID: <CAAhV-H40yf7Sb=x0muVT_DCg9D6YcEDTsfxY4kRQLHt0N5JYSw@mail.gmail.com>
X-Gm-Features: AWmQ_bmVOsPXUIgL__lna2Gqj7UeNmP9EwChLMhQmKCN1t149WIA1V0ifDBFeQQ
Message-ID: <CAAhV-H40yf7Sb=x0muVT_DCg9D6YcEDTsfxY4kRQLHt0N5JYSw@mail.gmail.com>
Subject: Re: [PATCH V4 14/14] LoongArch: Adjust build infrastructure for 32BIT/64BIT
To: Arnd Bergmann <arnd@arndb.de>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Xuefeng Li <lixuefeng@loongson.cn>, guoren <guoren@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2025 at 9:57=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Thu, Nov 27, 2025, at 16:48, Huacai Chen wrote:
> >
> > +config 4KB_2LEVEL
> > +     bool "4KB with 2 levels"
> > +     select HAVE_PAGE_SIZE_4KB
> > +     select PGTABLE_2LEVEL
> > +     help
> > +       This option selects 16KB page size with 2 level page tables, wh=
ich
> > +       support a maximum of 32 bits of application virtual memory.
> > +
>
> I just noticed this inconsistency: the text says 16KB pages, the
> option says 4KB, so one of them is wrong. Usually 4KB pages have
> a 32-bit address space (using 32-bit descriptors), so I assume
> this one is correct.
Yes, 4KB is correct, thank you for pointing out.

Huacai
>
>       arnd
>
