Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C391A198A0D
	for <loongarch@lists.linux.dev>; Mon, 30 Sep 2024 17:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727718792; cv=none; b=aNhqt2woVOsArTwnpe24hMkaKQq+qigMrQniuD4thDiMTPIGhabhixcyCiqX8UyJuVc4Rmn4k39FToXmhQq118ZpZFhYeqdxStQh1WBAu71gBTjrwSaCX7HFYxBRNVYNrjVNkkK5aPyISBpzGNsUS3W1bfALJ0/dLEdAdPm+psE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727718792; c=relaxed/simple;
	bh=PQ2VgHYe0Ngojxr8nNlQI/+nPbwGo4g+HQCTJc64GP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LhMMZgW59hdz6Xtbsaqdy+uxDvfjRr/cdtl0rRYzkBTSvErru4NW3X3MnPJzy5l0s1xayFQaHjBVq/GRvHcwoPCyZBF6HHo5XRdY4XOv92uxu1843lfa1DQdaxKwg0CMruuOOe2JBGItqxaDq56miSS67aINWYLVidOV8s26ZvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-50abc034f6aso384851e0c.1
        for <loongarch@lists.linux.dev>; Mon, 30 Sep 2024 10:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727718789; x=1728323589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZoyzlnnLRNj4i2u5Dgn44nDbhn4MB5fS72eP0TVQdtc=;
        b=jrF+Dp2cWW1dnXuOLfO6Pong2w1NsceNMvud8uLJ1mEZPkmUJwA4fr1opFiXOjVlAr
         JyrnMBUmyVLbDJWnnk7p5K09I18bMHwh7GQ4XR3yfNlgZBDXoAp4U7vbobChpdAJaEif
         0ZYOaekmfeV7rhZT0PPzsrJKUdwWunEYTqPVrhUwI0VkeCxCuQvkaXPWChoGnyqc7fsk
         E9Ui3noKmBkaUiXhcRfnVJSsJ0WD5JT7NNm2FMvpF3YN5ijhw/Xzf+/xOVTQK64/6uA2
         xrFQ9HqKmGkLTdcrR5LrL4R1UZ74E521O0mIeeuwVFCwmfahBPhr5csrgdM7nBoxz27K
         1Vfg==
X-Forwarded-Encrypted: i=1; AJvYcCWosOeG90wEJy+zRPKzvARPYUZfNvE8tASYJ9IbSXHn5hHyRwCkwNwj0zJfdzNZkiExEoFbysW5tGA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhNLmPf9O+L/w7CCMZNY8ynnKNSewOXqD274QpqxnDIm4azgef
	tuzgAlCd7yoa8dzg5I3A9K1Cm5Bv6TgkG95N2WGu/wchZUFiXGG87ijotQRf
X-Google-Smtp-Source: AGHT+IEZBhDqdKV7EiGkVejBP0T5evma5mNffzbA4zG1LDGDSfHIPF68EwhqbNMqc2QqiZdCvwGKZA==
X-Received: by 2002:a05:6122:2a0b:b0:50a:c31b:33d6 with SMTP id 71dfb90a1353d-50ac31b36famr2795767e0c.9.1727718789364;
        Mon, 30 Sep 2024 10:53:09 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-507804635aasm1011823e0c.24.2024.09.30.10.53.08
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 10:53:09 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-84e962c9a99so1333601241.2
        for <loongarch@lists.linux.dev>; Mon, 30 Sep 2024 10:53:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXXyljGo8LRtNUYVlbQjhQmVUfTp4lCM8aa9B9NhWuB/dEB/8KMOW04/uxnRtLaoUchqjLMHS9DJLE=@lists.linux.dev
X-Received: by 2002:a05:690c:60c3:b0:6dd:bbb4:bcc7 with SMTP id
 00721157ae682-6e2476334f2mr105898897b3.44.1727718393293; Mon, 30 Sep 2024
 10:46:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240930132321.2785718-1-jvetter@kalrayinc.com> <20240930132321.2785718-6-jvetter@kalrayinc.com>
In-Reply-To: <20240930132321.2785718-6-jvetter@kalrayinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Sep 2024 19:46:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVnb-fo2MP7ERwSj-sPNU3-QyikNinfhvgVa2DnR9jJrQ@mail.gmail.com>
Message-ID: <CAMuHMdVnb-fo2MP7ERwSj-sPNU3-QyikNinfhvgVa2DnR9jJrQ@mail.gmail.com>
Subject: Re: [PATCH v7 05/10] m68k: Align prototypes of IO memcpy/memset
To: Julian Vetter <jvetter@kalrayinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	Yann Sionneau <ysionneau@kalrayinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 3:25=E2=80=AFPM Julian Vetter <jvetter@kalrayinc.co=
m> wrote:
> Align the prototypes of the memcpy_{from,to}io and memset_io functions
> with the new ones from iomap_copy.c.
>
> Reviewed-by: Yann Sionneau <ysionneau@kalrayinc.com>
> Signed-off-by: Julian Vetter <jvetter@kalrayinc.com>
> ---
> Changes for v7:
> - New patch

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
