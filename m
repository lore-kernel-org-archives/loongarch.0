Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB5B5A0F2
	for <loongarch@lists.linux.dev>; Thu, 14 Mar 2024 13:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710423875; cv=none; b=SdTp7zLz/KLdcC3Th9jLubIkXO4DR+QrKvsab79wV8MlQ5KQzn/cUIUsockYDXJC64YXt7CNQk4k/jeREKsoKdv3U823uzu6BTrfjlcBrEYyY9oTzZKC1SXy18umPXLZI1FXQW5WD6dxgVKATsEeb/YYsjONpIT03IjOz9raWbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710423875; c=relaxed/simple;
	bh=Or0S+WGOwSC7Ncr7HBViZVdDj7Z438Sy1P38x9okT/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tNx+TeMeYzVd8Lk6+y7Jj0a4Gnj9pRrmXmVOvn9+Pg7IhUf40EAoypxMJufRNlhGUPdHtVzvC7wvyIPASWfiHRgr2JWhBwOED5cAt4Eg7RSgubQR/+w7/8NUjq5mbbb+YKA/Z+Sz+iIShx2czHYEeHLpxJUiVmo9HYr3eVgoACY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6ddca59e336so499732a34.0;
        Thu, 14 Mar 2024 06:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710423872; x=1711028672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDiARA/24cHYG8FRrouoTvUxwp5WbH/hNpGJ/9ezCCU=;
        b=Z86WEvD4mJPoCbGyR5hHVbZZgZAgNOS1f4FgVNGIUM0eJUQEEjSvAD25N5YpjV3Jp1
         poNdNH7XYz5LucOacCwspSq8vydJ0c4GeWJODMh5JhMFRzi31ta+JOjsCYZWtDzircru
         k5j+yKT+edD/i3t6YiWL++5K3ru2KP79doFTkMlKkp3TL8X/KC3zEqeraacUZ0sQIlo5
         qFYqlIVSfRnG2/ID+HnPRpGLezHq9XlNnAASkskqG0Wh0PqaqS22JuL3cc6JuAFimC5I
         Ks8u9CNC0KEaSUsqWtXGu6Gxk68J9CuHM25UrPCQXTc7bLFAjUuZEqsoqUI31x5YPyGi
         GPSA==
X-Forwarded-Encrypted: i=1; AJvYcCV2qYRgfYYexsMDzJsYE8FFTuDfstyEH25IrDBSfjd8+h9tMe0KJo+85KOskWJD2w8LouQmcUZ6TpgqQwfpaAYS9FrtWXU/XOvbeluRyxUf3lFpgCqkilrhBcp9x+x8F8e3
X-Gm-Message-State: AOJu0Yy2S2W5R8uab20ziW8HZ2izSf7qEV8Pxpan0Ol9q0DsD2RQ/IOa
	PIHFXZGq2WQDLhxABeH+x9jfL+jsdoI2vyInQMiKpqjzTvMBu9dqUqGcET93+vc=
X-Google-Smtp-Source: AGHT+IHVI7PjJd8py/3qlD5gC8lVofyyaZt4yiX8raPs/k9s7aJD+qO3FknnU0SYy2Sa0exV+JSWUQ==
X-Received: by 2002:a9d:63c3:0:b0:6e5:3940:110a with SMTP id e3-20020a9d63c3000000b006e53940110amr1269423otl.14.1710423872311;
        Thu, 14 Mar 2024 06:44:32 -0700 (PDT)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com. [209.85.167.177])
        by smtp.gmail.com with ESMTPSA id v19-20020a9d69d3000000b006e6695df279sm293847oto.65.2024.03.14.06.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 06:44:32 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3bbd6ea06f5so508753b6e.1;
        Thu, 14 Mar 2024 06:44:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX5zahZjREUEZHCxUhablGvpqEP5o0zjQnPeZO6YpWq45ajX0mjJQGGuoXDavlVtTR+pe6t94LOP7ICQZOAklEBQr8rnlq/ufZJ29cQKzoeuh3acO8LHSSn/L7lHAYI/NHO
X-Received: by 2002:a0d:fe04:0:b0:60a:4930:5bb1 with SMTP id
 o4-20020a0dfe04000000b0060a49305bb1mr1000757ywf.5.1710423424398; Thu, 14 Mar
 2024 06:37:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240312170309.2546362-1-linux@roeck-us.net>
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 14:36:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkvagJVEfnhq=Nx2jnmdS0Ax+zy1CvyN0k7k1EwUpu+g@mail.gmail.com>
Message-ID: <CAMuHMdUkvagJVEfnhq=Nx2jnmdS0Ax+zy1CvyN0k7k1EwUpu+g@mail.gmail.com>
Subject: Re: [PATCH 00/14] Add support for suppressing warning backtraces
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>, 
	Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>, 
	Arthur Grillo <arthurgrillo@riseup.net>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	kunit-dev@googlegroups.com, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	loongarch@lists.linux.dev, netdev@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi G=C3=BCnter,

On Tue, Mar 12, 2024 at 6:03=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
> Some unit tests intentionally trigger warning backtraces by passing bad
> parameters to kernel API functions. Such unit tests typically check the
> return value from such calls, not the existence of the warning backtrace.
>
> Such intentionally generated warning backtraces are neither desirable
> nor useful for a number of reasons.
> - They can result in overlooked real problems.
> - A warning that suddenly starts to show up in unit tests needs to be
>   investigated and has to be marked to be ignored, for example by
>   adjusting filter scripts. Such filters are ad-hoc because there is
>   no real standard format for warnings. On top of that, such filter
>   scripts would require constant maintenance.
>
> One option to address problem would be to add messages such as "expected
> warning backtraces start / end here" to the kernel log.  However, that
> would again require filter scripts, it might result in missing real
> problematic warning backtraces triggered while the test is running, and
> the irrelevant backtrace(s) would still clog the kernel log.
>
> Solve the problem by providing a means to identify and suppress specific
> warning backtraces while executing test code. Support suppressing multipl=
e
> backtraces while at the same time limiting changes to generic code to the
> absolute minimum. Architecture specific changes are kept at minimum by
> retaining function names only if both CONFIG_DEBUG_BUGVERBOSE and
> CONFIG_KUNIT are enabled.
>
> The first patch of the series introduces the necessary infrastructure.
> The second patch introduces support for counting suppressed backtraces.
> This capability is used in patch three to implement unit tests.
> Patch four documents the new API.
> The next two patches add support for suppressing backtraces in drm_rect
> and dev_addr_lists unit tests. These patches are intended to serve as
> examples for the use of the functionality introduced with this series.
> The remaining patches implement the necessary changes for all
> architectures with GENERIC_BUG support.

Thanks for your series!

I gave it a try on m68k, just running backtrace-suppression-test,
and that seems to work fine.

> Design note:
>   Function pointers are only added to the __bug_table section if both
>   CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE are enabled to avoid image
>   size increases if CONFIG_KUNIT=3Dn. There would be some benefits to
>   adding those pointers all the time (reduced complexity, ability to
>   display function names in BUG/WARNING messages). That change, if
>   desired, can be made later.

Unfortunately this also increases kernel size in the CONFIG_KUNIT=3Dm
case (ca. 80 KiB for atari_defconfig), making it less attractive to have
kunit and all tests enabled as modules in my standard kernel.

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
