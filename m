Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A213381B12
	for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 09:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368337; cv=none; b=sUceb3O2HEoO0NRnq/WQ+tU372ZmpASHpqFNHmJ/YOTDW+Fg1OwO7LrV0gnCyClkvvGTwIYHb9D8GnQ08VdBKe6imgvxLrMzCBU1f1d4Ziau51yZ4O2PrJ8aMgHiUv04FC7FaRkZ8EHs6DGh8MbYF80UQ0VTDCdoceisBsX2+8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368337; c=relaxed/simple;
	bh=WZ0dv++aH+AeLwkvbNXxLqu7wJ3mA6GpS63WG1N27Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HPDdSb3CXLIxV+uuYth0emTLQroHzajfXG22vzh1syWsxfaSx9rSZ/BrwSn4M6r+4zrG0VHIYfIJbGEbDMVbIb1wZP4HjMzmAyVpr2dsvoWUzgoKzBOgvT0WSy2/Jpj+QxQhiJl4+iY4p0BxGCe3ceVzM24zXUff6rXAt0o06cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso15343093a12.1
        for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 02:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368328; x=1777973128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al22kA6RCf7FSEzj29cZLSkjdM9EgXxihmBX7/SeSVI=;
        b=e6ppQogVYk46z9c9e+QQ9zGlZmO89UIgrQ8Z7kkvhzI92aVVk/Sk2NG6jkLqQlco4P
         vW3FTBE1U6cozv5Ji90JmCiEDEl99z1D/BaXH6rxZNg3J8jXh7D2z9PERgjGA1UkvwRV
         uynebSUsI00bH2/dc9GfK1UZWduOcMJ9ZE6sIhS/g59QrkYhY37sC2tg4tbRDFcSMVnh
         z/B72uFMs6Roc1g3CAAYaW43IwbFiGpEaGcB9L+J+wEi36G/AiqD7+HAgH1BTMHcXXEi
         RKqsE+swmFhwTm29k1jthdwr0fNKiX+MKGQmnHrDijZQva1ANFfQkUlGphd/crj75LW+
         kuaA==
X-Forwarded-Encrypted: i=1; AFNElJ8A3EjBL6qB2agMoaoTE2cGqw/MgTVxzwvyGtcC5/P3RSrssQKA8BiMJgN4/Sf3HInlRspaxv3lQa0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywrsag7aQ+pG1X45Km4/YLDj22G7ADReFgXsE1/AV/dxkBTjD5s
	0hVdypftV1TpZykrEqBpXtE+YD1wZrRKlQnEWk6zEvUNnjVHPnOew5KUZdAlkLwB5Gg=
X-Gm-Gg: AeBDieu6lslNjIR8Tri5IYIDId9X3iRO5eRX4vVdM0jiFUCz28NhaBxmekLDihlz34R
	YuLCp4vcBsdRRhyIaRq2VfJQ4Hk5LhqT9B/oNOl3bCnwdZe8qnXxdcPqIJUTNb73a4jgfVqvKnu
	pe12NMGA8LM9P6wfC/SP1PFZ7MfwpsX+m4LfqDzWihcRxbE/4K74aLmvhdO6uT0GV+QfL7aZ2B5
	UGB1sqnvD7E6T9oOTsiU0IOmqocVDPCxy4/j/25ElDCbUI0TYkkA8aSmH+p47ISKHpn+jH0OzVq
	77bJo9mA3eheil9mDh4aEaHUtuGf149WRe90UTI6bVpqRxXRa/o9Gtndxx+8ttFufAIOXxUjcnA
	h8HZjbbrfPAz9Q8kudei815bm4ITWqGBWKpJ/BmpjPgRmh3QoHz43XewN/6oIe2GWxbM7i9f3Pj
	eIxJ0wjKsE7t3Lwr2Omd0svs3K7fOFaA3VuWxUICposj8t0ygwwWVQ99wyWCq9BCSJQUTt+VY=
X-Received: by 2002:a17:906:4796:b0:ba8:1647:3b7b with SMTP id a640c23a62f3a-bb804727ff6mr140070766b.30.1777368327944;
        Tue, 28 Apr 2026 02:25:27 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80b2adef5sm72609566b.40.2026.04.28.02.25.24
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:25:24 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-678a526f374so7365037a12.0
        for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 02:25:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Y5i2uUGGGr9hwtPjsSLMnN9Zgllmv0flQJRucQr7iuJU+Xo07TPdzs4JW/EXLRs6Dc2R9/oZfB84=@lists.linux.dev
X-Received: by 2002:a05:6402:5056:b0:676:d8a1:7a04 with SMTP id
 4fb4d7f45d1cf-679bb09a4admr915149a12.23.1777368324094; Tue, 28 Apr 2026
 02:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
In-Reply-To: <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 11:25:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
X-Gm-Features: AVHnY4JEWBVPw4tSjHgbQTia8gZd2WGJ1sv6qLdKJbtvs4hms1blpvc35yb0VWw
Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/9] uaccess: Introduce copy_{to/from}_user_partial()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Christophe,

Thanks for your patch!

On Mon, 27 Apr 2026 at 19:18, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
> Today there are approximately 3000 calls for copy_to_user() and
> 3000 calls to copy_from_user().
>
> The majority of callers of copy_{to/from}_user() don't care about the
> return value, they only check whether it is 0 or not, and when it is
> not 0 they handle it as a -EACCES.

I think the "a" can be dropped.

> In order to allow better optimisation of copy_{to/from}_user() when
> the size of the copy is known at build time, create new fonctions

functions

> named copy_{to/from}_user_partial() to be used by the few callers
> that are interested in partial copies and need to now how many

know

> bytes remain at the end of the copy.
>
> For the time being it is just the same as copy_{to/from}_user().
>
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
