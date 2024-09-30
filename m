Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969081F947
	for <loongarch@lists.linux.dev>; Mon, 30 Sep 2024 18:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727719210; cv=none; b=SCLkpFw7gUy1JKbJK3vm0FbMVJKcM1g6qx3GUjyIPtCZo69e+GCOtEyusgI/zLy06KiZg9gUd/xyMzHzQyH9yWqNyeX3RfZ1SQaFq6WQq6cfrn3D1k61u/ZomPKAwZUcqOh+jMhE6818S4ZSWyjP8JY3pGqUbysE9YfJoIlIyB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727719210; c=relaxed/simple;
	bh=TOOuuBttpBHTK/VFXkEJ6D++xCveU/rYxT8fYGWJb0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sCfDu0w0eLD2EaTIo9X5rrniX0YxZM4hXPX+BDV5NkMHwhV+OQqCATxNZOtb4lMROUPSBYEWjiYKLtwq/RauZ+I2Bw1Xb/0zBP8er0MnH16pMp8/vvv42A1QUJSFixNF2Up+1pXDmNJEHhwdP6TV6HZBEw7vpP4AV9XdBIaLIKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-84eaa79a00fso1075899241.2
        for <loongarch@lists.linux.dev>; Mon, 30 Sep 2024 11:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727719207; x=1728324007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uPwxLcg5Bq74tqCqqhr1kbUuC1X8WKeLcVZP/gaR94=;
        b=w6kGhLcjh1pbrmPrNgNnKcOg5NDO0rjw4pMd4YGzKSMjkcwAIt94EmZE0muv7UpaXl
         ZQEYHnQBYQMVdHGVDh5+sbslT0zJhbhzbabucGv20vTw1Iq/vw5vcZvsa04CkoE2pgmR
         dv8xW4Wj35f6txUBTDvrlyfHUiKOmc1gr798XezWvslaR2rBHrXGsAqu8iHrxIC+uDKw
         auDXf0toYevne4Pz4RS8wDhff2ittYYkfOz/YoYd+iBui8wxG/3pcKRon9q8ey71GAai
         eT6vy+gyIrC5+1CbBHOwD0HwlR/LARMQeKChtaOQ88X6TtKZwxY9A/+YEW+NjQZ+2iBm
         KshQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIwWZnLLHzhFoHpDKnY29u00F5i6pdWJdqSqbqU6ZAZaA5ui/CpeG2fLMoaEANY+EiuoQmhYQqF10=@lists.linux.dev
X-Gm-Message-State: AOJu0YwDBDexLa7djnHE9NMDOzDNNRj1RAlAC2UIRqtJwmIjCbV0zn2/
	ZPIO6k/Pal0Y0xUVSX1Aq+SNc8DZYj5Dm6Y8Um3dNxh4VyC3E/+NsLY9JsQT
X-Google-Smtp-Source: AGHT+IEJjkmlD15Jcbb+Nygf5JVPe0a4OuqUcthaMab642jqaGn22xTBbPch00jqozFZaXCD+SGAOg==
X-Received: by 2002:a05:6102:c53:b0:4a3:b815:d7e5 with SMTP id ada2fe7eead31-4a3b815dcf1mr3828555137.29.1727719206927;
        Mon, 30 Sep 2024 11:00:06 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-84eb2133865sm1049672241.12.2024.09.30.11.00.06
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 11:00:06 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-84e85d2b5baso1258840241.1
        for <loongarch@lists.linux.dev>; Mon, 30 Sep 2024 11:00:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVwMH74yJT90paCi7exmmJvzCplvlAC2E50yoDfm63BjMPMh1xqdCdVNl1X/Zquwv6XtKSe28nOlrM=@lists.linux.dev
X-Received: by 2002:a05:690c:d1b:b0:6dd:ba22:d946 with SMTP id
 00721157ae682-6e247561690mr104291347b3.13.1727718756479; Mon, 30 Sep 2024
 10:52:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240930132321.2785718-1-jvetter@kalrayinc.com> <20240930132321.2785718-9-jvetter@kalrayinc.com>
In-Reply-To: <20240930132321.2785718-9-jvetter@kalrayinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Sep 2024 19:52:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWpiS-MgQZ8YyX=PDvQ+ZvS5TdMV5wn11MKFZVT7CHDhg@mail.gmail.com>
Message-ID: <CAMuHMdWpiS-MgQZ8YyX=PDvQ+ZvS5TdMV5wn11MKFZVT7CHDhg@mail.gmail.com>
Subject: Re: [PATCH v7 08/10] sh: Align prototypes of IO memcpy/memset
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
> with the new ones from iomap_copy.c and remove function declarations,
> because they are now declared in asm-generic/io.h.
>
> Reviewed-by: Yann Sionneau <ysionneau@kalrayinc.com>
> Signed-off-by: Julian Vetter <jvetter@kalrayinc.com>
> ---
> Changes for v7:
> - New patch

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
