Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2582953A9
	for <loongarch@lists.linux.dev>; Fri, 12 Apr 2024 01:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712886879; cv=none; b=rREldIn44wLanP8pFkN3tOkzncSCuElIQ6JH+WpIEIyaB7peuzui6dCBlwjljcR0MYE7iZhm2iZv+yyRAbea9FkwqUJoTmxxwfl5X3Q6POUuRxK621sasYYYVoBSvuZo50Dz8eiUS95ACLcnyvr1JJV3Eyc+F2awssyVWCQpqTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712886879; c=relaxed/simple;
	bh=y4vlt8TB9yDjErxa7aoPppj34TQs7XIg9OjF7nGdMbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gIGvdWT8BE5Yf+wceiyPfbr4z7uWtdzjoB//mOuIyjZr4Kw1o+zPEseQr8U7ZnOxFbXuu9/vCEptHFPcFszmKPjOlary1qRwfhg8UzE3TMx92fjnM0AMwRe6xxdnb0ybflM7b4oIkdRGBf1DcWRzgmTjynQ8PMPtHBGDsm+Byx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/4ZdWwr; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/4ZdWwr"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-346b09d474dso363181f8f.2
        for <loongarch@lists.linux.dev>; Thu, 11 Apr 2024 18:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712886876; x=1713491676; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y4vlt8TB9yDjErxa7aoPppj34TQs7XIg9OjF7nGdMbk=;
        b=J/4ZdWwrgR9FX0L9SlZaYYYRazcM4OH7DNWVigqaIDzfN/5eT3DkJHhTbw43pMwdDo
         FbctpmQbSSI7BMVn0hcRmv2nnfZZjZHInt/ILTODAPHf12IrzFZ4cFtJkkO+ubGRs1zg
         9ovBJzIOJ7GdLzhec/wIuqXvzpNJ2OdQhFOl54dPrPZNfYXjIR16tR92vz3n/iYk0Xcu
         FhcoD8qhd0E3eJ2yw9ReuXJjHogBlfRIeExjxV8HgSqYgA9LcMc7TD9bICNnkvAgUuOZ
         rYt3Ootw92EekLzfo+To6y7lFyXfl/dl8Clk1DARzddHLnyox0C/Rz91S/VZsafZ2Txy
         n6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712886876; x=1713491676;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4vlt8TB9yDjErxa7aoPppj34TQs7XIg9OjF7nGdMbk=;
        b=rv3hFW5C1e8j5yXtW/7gOOUsFA7zOGVM7j2kIW5ZwqKv2049tr6Oleo7R/Q4Ay7GXp
         /+tS6u9DuE7hjf3ihPeQVN5+hEA3Zsz9O4sBsgfxQRGFTL37OzvilcoKHokNewpUzSIX
         iEEmOFPYxW+ISlg0E2+p+erUA4+a+RvAqgtAYDCLc6AWlVXlLro0S0hVEJOrYtFn6SAw
         qWJDi7M1vQq1DE+5xutZfpYv07Py+UtstEaJ9o2gEMuCIXVZJrhYtH+vrvNx7I4JjxLv
         kPEL7slblNqYw4nQb2e9Y7SdMpzkbFhJqfav18wBswz/ETZpy3XwrWNiAiFI6na1ZVeU
         CqfA==
X-Forwarded-Encrypted: i=1; AJvYcCUg1az54kXxNPUC7PM2jtNkKQrbPayq+bk/Icuzi2vkmyxLelaEJtjXOMLF2z0GLvE7jM1PeT31wTJufqtaZB+Y2V+gSjn+9ynn
X-Gm-Message-State: AOJu0Yxjf5Ws6kB7aZnuZDgjrO9OauWkC9ilhgfk8TKhh0OqwZXOjG2I
	VSXqjJ0lAvrHpBgw6BBbkamLmZnpp3gniUVeWC4xvEFwJidDuK3frqGdg6l+yeyl6PKFbadi+CM
	XpYh6uSeDHfQnbYeTyeQyMjo/wQ4=
X-Google-Smtp-Source: AGHT+IH+PR4h3oVtQ8Ez0cRs6zyDvlUxECTYXxWqfVRSac34W79R5yeA3Zq4bIaDyQbovOeeCgfyqRUJHwPOnRqGQX0=
X-Received: by 2002:a5d:474f:0:b0:33e:ca28:bb59 with SMTP id
 o15-20020a5d474f000000b0033eca28bb59mr856430wrs.57.1712886876424; Thu, 11 Apr
 2024 18:54:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-14-samuel.holland@sifive.com> <87wmp4oo3y.fsf@linaro.org>
 <75a37a4b-f516-40a3-b6b5-4aa1636f9b60@sifive.com> <87wmp4ogoe.fsf@linaro.org>
 <4c8e63d6-ba33-47fe-8150-59eba8babf2d@sifive.com> <CAMj1kXGW5XQxXrYaPhT6sCjH7s0EwqzNjWies3b8UWnUBW5Ngw@mail.gmail.com>
 <c0e170f7-5498-40ed-ba35-2ac392c2dd2a@app.fastmail.com>
In-Reply-To: <c0e170f7-5498-40ed-ba35-2ac392c2dd2a@app.fastmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 12 Apr 2024 11:54:25 +1000
Message-ID: <CAPM=9ty_9yKEk+cS6oJ8gD_UiB_K4X3P4mLv2RmKixLaq-1RfQ@mail.gmail.com>
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ard Biesheuvel <ardb@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev, amd-gfx@lists.freedesktop.org, 
	Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Apr 2024 at 17:32, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Apr 11, 2024, at 09:15, Ard Biesheuvel wrote:
> > On Thu, 11 Apr 2024 at 03:11, Samuel Holland <samuel.holland@sifive.com> wrote:
> >> On 2024-04-10 8:02 PM, Thiago Jung Bauermann wrote:
> >> > Samuel Holland <samuel.holland@sifive.com> writes:
> >>
> >> >> The short-term fix would be to drop the `select ARCH_HAS_KERNEL_FPU_SUPPORT` for
> >> >> 32-bit arm until we can provide these runtime library functions.
> >> >
> >> > Does this mean that patch 2 in this series:
> >> >
> >> > [PATCH v4 02/15] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
> >> >
> >> > will be dropped?
> >>
> >> No, because later patches in the series (3, 6) depend on the definition of
> >> CC_FLAGS_FPU from that patch. I will need to send a fixup patch unless I can
> >> find a GPL-2 compatible implementation of the runtime library functions.
> >>
> >
> > Is there really a point to doing that? Do 32-bit ARM systems even have
> > enough address space to the map the BARs of the AMD GPUs that need
> > this support?
> >
> > Given that this was not enabled before, I don't think the upshot of
> > this series should be that we enable support for something on 32-bit
> > ARM that may cause headaches down the road without any benefit.
> >
> > So I'd prefer a fixup patch that opts ARM out of this over adding
> > support code for 64-bit conversions.
>
> I have not found any dts file for a 32-bit platform with support
> for a 64-bit prefetchable BAR, and there are very few that even
> have a pcie slot (as opposed on on-board devices) you could
> plug a card into.
>
> That said, I also don't think we should encourage the use of
> floating-point code in random device drivers. There is really
> no excuse for the amdgpu driver to use floating point math
> here, and we should get AMD to fix their driver instead.

That would be nice, but it won't happen, there are many reasons for
that code to exist like it does, unless someone can write an automated
converter to fixed point and validate it produces the same results for
a long series of input values, it isn't really something that will get
"fixed".

AMD's hardware team produces the calculations, and will only look into
hardware problems in that area if the driver is using the calculations
they produce and validate.

If you've looked at the calculation complexity you'd understand this
isn't a trivial use of float-point for no reason.

Dave.
