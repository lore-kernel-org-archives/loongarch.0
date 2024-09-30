Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9F718C31
	for <loongarch@lists.linux.dev>; Mon, 30 Sep 2024 17:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727718673; cv=none; b=O6H5MH+V+cyGK1M2YHLUNjjCHK0uJTcVvkkXPLkpGw+92ZDAWuOv1s3B8qjpVOa7HUwP6LW+4T0cDHB22D69SzE2QhEsoVLt0uXNkDZ5SbiiIdv3ngno4jKvtk+99qPWqi/aW6LAMqwTS7YXBp9incnt65E7VoIWf2bSKhoZJd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727718673; c=relaxed/simple;
	bh=x0pDw+4SzE1MkSrrBfzhcseWxrldz0hn0pxuu1IaAPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nHGIAnMvR6gdPSkMsB1157Tilnr23fbEuRAQI7EHlbM0DugwU6EdZF5jTQqgZNTL6lUNocTCl33cAQZ0g2S/e+HC3AKHTMtN5XGlwrQiXNol6kAJQrYIbwtuEIy1GhqtIm1ZIBJgEKPBnDl7szkSBvGNQ3h7y6YO7zcqtqUTc+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ddfdeed0c9so36308377b3.2
        for <loongarch@lists.linux.dev>; Mon, 30 Sep 2024 10:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727718668; x=1728323468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ERWUip0Hd+3xSPGc5KF+LIvmSrz8p98q0i+WVSFZa2o=;
        b=WfWHNvHdrfh0PdAPMPNW0CLY8ecQJAg/iWotHHcS/Qju3r9DMrNudgcNonTgK3PyLj
         LO4P0J5lDn3NHlQSJ9NL5gheLv83DtuA7wf34SPTUXV4pcOy9cvkNla3nfbr06I+I66c
         zCGRQe46BLRs9Rc9Ecj+RHxMvak8GCGOcIUQReul+pGCSSL3g7oGcTEViZHmAQ6icxuy
         iG5nmGjnkF3iWyvrvkIgPslvJL0ebG7qAZaCkkeFfB5iuD8XlOjMGU+dsGJpn1cMoyQn
         zL+97WevdMofHF2ddij6T1kSgqa5Zqo7WZt44dKejIzi3nHvF1OI9V8o9PSsLs2ZASkY
         +uvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUnVFLSAYfBpq+O4CxPPEgNZOm3ydWryqI/qK0xb5E1T79WaagnKkhrYh2ofvflE0n6wBNmDKYIPc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9czCparwm/O7m5ZYpD9ZJ6sT7W34T/3qswtQN2Lp9u0zWmBj8
	evjcN9jFTbyp0gDgm908ek1noJ5Lgy9aBETWKkc02p0ZW2kSNPduNpRVw82N
X-Google-Smtp-Source: AGHT+IF/E0V1qCIEBCdBDicE3NjiWVMVEwDDS6WzmTKQx8v4tm7Q/7anHdANNqDD7QlCgPEbOTx1Mg==
X-Received: by 2002:a05:690c:dc4:b0:643:92a8:ba00 with SMTP id 00721157ae682-6e2473aba3bmr113898257b3.0.1727718668087;
        Mon, 30 Sep 2024 10:51:08 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e24530aeeesm15305957b3.47.2024.09.30.10.51.07
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 10:51:07 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e232e260c2so36865967b3.0
        for <loongarch@lists.linux.dev>; Mon, 30 Sep 2024 10:51:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/PThvYHXqO9zte66OOXtiSjGx/mLp2dp9ePNvWTbYdAw8aIRURkMa2oANNJ8nlmxOONtfVLhuMyg=@lists.linux.dev
X-Received: by 2002:a05:690c:c0f:b0:6d3:d842:5733 with SMTP id
 00721157ae682-6e2475e3050mr104508727b3.35.1727718666765; Mon, 30 Sep 2024
 10:51:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240930132321.2785718-1-jvetter@kalrayinc.com> <20240930132321.2785718-11-jvetter@kalrayinc.com>
In-Reply-To: <20240930132321.2785718-11-jvetter@kalrayinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Sep 2024 19:50:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX03ornwefrTfSYfH-XoEE4CHN+u5m7ay5_LrTq8XHOJA@mail.gmail.com>
Message-ID: <CAMuHMdX03ornwefrTfSYfH-XoEE4CHN+u5m7ay5_LrTq8XHOJA@mail.gmail.com>
Subject: Re: [PATCH v7 10/10] arm: Align prototype of IO memset
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
> Align prototype of the memset_io function with the new one from
> iomap_copy.c
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
