Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E503DA5D0
	for <loongarch@lists.linux.dev>; Fri, 10 Apr 2026 15:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775835133; cv=pass; b=Fy8J6ibZLkka+tLnHNV8E5TnbH9lh4JO/AqNxIMZb3qV41PKQoRtbolqNigvz+UnF8nNCG4W2/NQx4Fbjy1sAu50yfiY5NlTiZMM7SUUlmHnTiOz2fzAoJ9EvF3UGzE/uG7F7pZ3S8KtEZQPdBr2KEBpU+iAKWHIAOilN+ssskU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775835133; c=relaxed/simple;
	bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQEcVluRzq/5194PqeO3Fq4KS1hdM8QQklAzH6EXvmELEJOkk/1IUrKU/qYvXcFoet0d7se4RccrkB3GE7w5l5NDLSDXahzDWE1z8wKbl6vuv4Rsp5wqhp1cDf/GG8hjmUgB7vhWZJOYcUSC97IsNhhQLdRZektrrlB+M938yqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=tVGKk/pS; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="tVGKk/pS"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12c1a170a50so2014878c88.0
        for <loongarch@lists.linux.dev>; Fri, 10 Apr 2026 08:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775835131; cv=none;
        d=google.com; s=arc-20240605;
        b=ANr61SYrJqUoX4a6Oltg9/YlydAUA99G+uUjw4DK8jz+TPq4Rfj+eZuEjIuUdNTGTA
         TyGWu1C2TBfgSnD+OUwgrvUfJ72BqrVyOeSZIeEX9ASROa6R1GxdllfC6sNH4qVdgyPR
         daq6Fz6/E45u/aHFvue9PUYMrM4L3ZT8xyIXMBTE5EeNtX+IkskYLjblzJPghR+KNiDH
         S9YzSoxPGTfE3VsUTxbMo/aRLsY6UqRWfeX5ijHnT7D5iWAALTQR0H7Cu8+mD2fVcHZD
         nR1HPjg3Vn26w/ZleLSFvfn8ghSj7LW4D6XZrIa+9fUYjybe9V4G8TkRuVMl1S5NAcUJ
         7WXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
        fh=0RxUS/D6iLOucDX1xzaetmSFykKkurcpU8RDZD5kG5Q=;
        b=NZuT/0b1G9Zk0VyfE/BqsCCggyJu+udPLaJ6WqyrYX/LJmGx7CIVaeteJb4SMnf7Ai
         h9qk7nkUtWvqPCqiv/kFh49XUTAIQBnd2CYwKYTzL/8llU1q52Qxz9ocPiftjqzOrosh
         gD7UccBLmp3t49Cul0hQ0n4xUw1SrGaJgnfbrJ3LEWmnQuSJfZdrfgCKltVtTD6bSWbi
         foTbHbkfEh9KDQmsOkJk4DDs7LH4hAuiwExx4ouSamTzHZ6TfUkRaoRGY4q9RGdFfIzU
         JZrZWOCu4iKF6WduEpibbOb0rDjl72RZLSjSnke50D3LlkajxchmCRS/UOvW6xLJDBiv
         +9PQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1775835131; x=1776439931; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
        b=tVGKk/pShOrXGqzk6PJ3Nc3BFXNTo5KoR0jQxMAmm/EUhDukyaPPowEZeDsH2W0gmD
         fnGI2GPoM2GQEsHzTGX6m4nwYsDPY30G1fAqw3oi8wfdShSYky62zbwVmKYCa0lHo1W1
         Fl7q9CE3YI5VXO2I7qTtuYnHV/NCr+YWJwih8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775835131; x=1776439931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
        b=SHfGDrGE6M1Qz2IO0r98E2q7jji3oRYVuvtuok2nQ1Gg5AoXSvDlqtZe+VWnSxq+rM
         D59CFCSK1hYUSQRzgqKpZ1cVhFy4/+XOvO8bQlXTgMRp6ouZGgB/s+kwGYsjTjX5NSEw
         gNk0jAH8xg4MSKsMpEDHkgZyxQ9ssg3E5GFLWGGXr+pCiOXGpi0bbmbNEacCrYYtxEjE
         q1VeufdvHksoODgRgSk9B5Z3alrct7j4X/AOA1DYE/Ojj5PAhUrE/dBttgyjFy7xv/Bb
         jyCwZX1qsPGo0ToGh6tPsnn0McZuKaBMNKenz6RneczEDRAhhxGZDFIL/t8/F+6OlAFZ
         v6/A==
X-Forwarded-Encrypted: i=1; AJvYcCUf/9kgeFxEKEzM+iZsbqh0t8a7vH0Y+3gzi3hWdg4MxNoAVXNjNK/wVSk24j84M8qXrGYUKOL0tQs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMmiTsItlSf73NSuC86s032LK3hICLVHlGp6onLChUmAiLRe2C
	b/xzvaYMLBVmPMi0DYj3MQ3K2lrxWmo65GybrkgyWl1texeuctejarUSsnA2hJKCEEnBwwMih97
	AHIen1u/yD8zxi7oPL44F88Hb/Ene+Bg7G+hLJIqbSQ==
X-Gm-Gg: AeBDietZvRLLuU9Zf+ib92NQAkHsNAkpW3deORLAJhH6C/uAli8IzhL6BW0qMoWP3z4
	B6MEf5RY+yoz9N5Kpttd8TEczkXknLEWOieXYaVjkzyqG4YkLSVpvUK4JxKZfLyz/+Css7vcxS5
	FDGxO1PG7Y+Dh9ZmdmaaH93I/F/QR6QyyiKjebdsE48v9HDv0WoP+cXvG/bF88ZPMvpHFPm07XW
	m4OZs8TFpzLhtEnCl5u5oqO1IAgaqEQ4sm8eXOPlxQkQY0djB+gOK/TDaUd/jm/fkWZ+rnfMjk3
	O+iE
X-Received: by 2002:a05:7022:6097:b0:128:ccb7:7fa3 with SMTP id
 a92af1059eb24-12c34f069f8mr2159203c88.34.1775835130696; Fri, 10 Apr 2026
 08:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120319.397219631@kernel.org>
In-Reply-To: <20260410120319.397219631@kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 11 Apr 2026 00:31:59 +0900
X-Gm-Features: AQROBzAnX-XEClLFV-qWYFUzCuq4P43sNZviESiWFI1yCPXm2VtVZ2QkaUGJoPY
Message-ID: <CAFr9PXk7qK8-2JWrrfgXHoS9JWTRL+WobLjmAesyCE9VLL8ZyQ@mail.gmail.com>
Subject: Re: [patch 27/38] m68k: Select ARCH_HAS_RANDOM_ENTROPY
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

On Fri, 10 Apr 2026 at 21:39, Thomas Gleixner <tglx@kernel.org> wrote:
>
> The only remaining usage of get_cycles() is to provide
> random_get_entropy().
>
> Switch m68k over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY and
> providing random_get_entropy() in asm/random.h.

I have built and booted this on my Amiga 4000 and it apparently still
works so FWIW:

Tested-by: Daniel Palmer <daniel@thingy.jp>
