Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E263A7F5E
	for <loongarch@lists.linux.dev>; Thu, 16 Apr 2026 11:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338968; cv=none; b=aXjRNS3iqkovjlIMzVRFxSerXr3pcUbovT1+IvKbOJuhxFvqUVFJnBUVYWCjANZ42Jj1Z0Z2P0930NPxtCZlf7jGG99OaFOPMavY5EMZnA/wE/AGhRUCphO1QMbus9sSBY0o7shSZA63F162x2jyE6dYAoNRriZ1TJZhtwikzWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338968; c=relaxed/simple;
	bh=FSgVIzpnraycKQsxAztrNgNSM9On/XU1ftEj+pCL/gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OxK9FljvwKBpamItjO9DBuEJJuq3rr3e/yXcYr3GXq+g8kFF37bNbeM/0m08BVlp678imDx7PnR1HN7tmkEq+7GH9rvVBYk0aXKDAotcj485Xo+nXVx7WAFnW19hxny5Ywp8g7FelnIi1J83eTgHejYIjhJGl61ObI/ybTEJ8As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d7ebe11bffso6532452a34.0
        for <loongarch@lists.linux.dev>; Thu, 16 Apr 2026 04:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776338966; x=1776943766;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AptjVPQ97g683jPGYCmYUacoTRTAG/3/TQY5t1TSdkk=;
        b=J6N+CBUNwYGHmiMHKRZDrRR2MqVjLk7KePzKlfJg4K2zLlYN6NCb9WMLrsOaRMegYb
         Mk6RbM3d3Lnai3zaD3D1f3gTf1PfKQplfbI+7YCueHLYq5DEnEbG5a5Gai9tM0DRKTv4
         xzsv3Zm3vDsp1etDMRKr37qc2M4ryYWZ1V8Kc3p90O19bKBY49gaGjCenJqM1aZifHdP
         kVdupfMu6rkOLMaEIa4KYC8ebJi0nDkzZVMa94nWEfEvZA/Agh5vs3zSiSVFIbZogJVo
         hpqiYqlB5BTfOiKdYyIukW6PnJ89/lJoSHLbmCjq6LI3ezml3SA+2Wl4GaWjPB4ZfD7o
         JUaA==
X-Forwarded-Encrypted: i=1; AFNElJ9eEtfLTXzhXcGXvrVw3ZNzuF36upP1LLLnZYckWqakoPegeAKthyA5iU7hhSMW6OFdCZv+UeVIVAc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJB7cQGDloWNkbjKuTCrpAnNhDMNtW4QldZL7qGcJu9ZM5i1FJ
	msc/Xybmipt0cPB3HSSQD940zNpDMTtKvULjHC/wVh9Fe+tg/ITeU+XAyqf1aY+P
X-Gm-Gg: AeBDievKbQIL4s+g7HH9qZ6gW5ZDFLUzFr7qNwJx1BYtztQL/kbIqL8bZSYhLBDxoKt
	DwrNre1FSwJ/VeC0QdgG9+o8cggu8ziHanYDWJv+LeMgvgvaPEvo9gTwnAnApIb4ZkOx1QXDvLX
	pp2p8vsvcUU2e/0b0Qn/DyD7381w1ls80LyLNVjNev3aKj3N6hgsXR3i5IWtsUd8XC5NecTiduy
	C8+WVwCHK6WcUpK6fPok41cYPp/a8xeOgaF6Ox6lECqyGeELg9k3Ag+5A3xRWehf7UfqYKrwd/q
	BWwzSEY7Wpnepuu4YuDfaXAyrnF8lLhxO6dY9q73NCecYpes7VuL6piDX2i/SjiPC3AmMXXewGh
	aLvpu7wco9HLMHNR5Tuo47pe23iNNJI8T568Vn4bCrJ5hMX8ItvgHUffRrLrwLq5/UrHBDjAxhy
	IhO396G14aJ9+3tMIaoxPLkFJN0cL7B7PGaxC45O5VW0SFm2DV5FlZriAh8opfkhRNGhUxZOhyW
	EY=
X-Received: by 2002:a05:6820:750d:b0:67c:27a7:8c4b with SMTP id 006d021491bc7-68be8bde8f8mr8889607eaf.54.1776338966426;
        Thu, 16 Apr 2026 04:29:26 -0700 (PDT)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com. [209.85.167.180])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6932dfb8d5esm2326301eaf.10.2026.04.16.04.29.26
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:29:26 -0700 (PDT)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-47952229034so2875547b6e.3
        for <loongarch@lists.linux.dev>; Thu, 16 Apr 2026 04:29:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/YUilqDGHXLBDHC3bbKaSVTLBfpxo82VRf9r3Cms0eaDCEM4t9ckams3NfLjVfAb0pDqqJJh/3WVk=@lists.linux.dev
X-Received: by 2002:a05:6122:788:b0:56f:1ed6:1d29 with SMTP id
 71dfb90a1353d-56f3bca6059mr11244615e0c.9.1776338533353; Thu, 16 Apr 2026
 04:22:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120317.910770161@kernel.org>
In-Reply-To: <20260410120317.910770161@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 13:22:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1aShz8esbYzJ7T-0Na6++_Yi315aCiUx0Cnsgod5uUg@mail.gmail.com>
X-Gm-Features: AQROBzBwwjc8yd10cT00Tu5Dl2qrCYQStWr3Lcobhh8coMrpPeCH9vhBSNokYJk
Message-ID: <CAMuHMdX1aShz8esbYzJ7T-0Na6++_Yi315aCiUx0Cnsgod5uUg@mail.gmail.com>
Subject: Re: [patch 05/38] treewide: Remove CLOCK_TICK_RATE
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
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
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 14:18, Thomas Gleixner <tglx@kernel.org> wrote:
> This has been scheduled for removal more than a decade ago and the comments
> related to it have been dutifully ignored. The last dependencies are gone.
>
> Remove it along with various now empty asm/timex.h files.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

>  arch/m68k/include/asm/timex.h       |   15 ---------------

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
