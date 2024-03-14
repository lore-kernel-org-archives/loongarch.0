Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434B05CDDA
	for <loongarch@lists.linux.dev>; Thu, 14 Mar 2024 07:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710403082; cv=none; b=FVkxzx5GnGHc2+2B8y8xDqtGNL+SBNtveLL8GLgaLuJpWM9wC8XHpEfRK1vcyIhXjh8Xwz0oczW0smSo/oU6fgGPXzt0DQ+eAuxSIEH9XaKt9G/FT13saQccDtg307ZXQBj0AZbWnCg8Oaupveg1bsI+r0lsMQySVKdwC5QopBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710403082; c=relaxed/simple;
	bh=GdqPCgNgGmabZKEFpqVELT68B4Ci/C3EGXs0bq1Jxn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=APnZB0yQwttSn0PXEWZKrlVjcKTkhToDBeogoSjNkWBZ1IgQL43LLAkswg74zISSByNH7/DkWGcL7G5ZY9rU23J1YYulvN4t8N6HYTZ8laXPieiFzUbxPr3Prf/CYOxDm72s9pfg6EH9aPXtLC26LYG+qYmd7LWrXe2gccNuA7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60a15449303so8187577b3.0;
        Thu, 14 Mar 2024 00:57:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710403078; x=1711007878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kd7vHFr5fszcwgfp701zhW6bd0WPIDQKlsKOb1KQCg=;
        b=UfdkIymObOBkKwgIj/lXPQ9tDLdieltmQRJx4aKWbT9bhPtJlTnZ04TMjSJVMC4wHy
         StVhaFI94XX7uWCh5l2vhMOF3SIcO0QSKw/dl3k0kVNCAzQA62VavFvQSYw6gVqp5Ofg
         ykdaj1aJ1aJH4L+GnE+65sPQ51Iafw6TwrZ5QA9h0f0QMsP/kB3GX9Yt3JKUtzE3mlbb
         PIAoGVSw+pfTZHJPdo2Pi1bra97cTGk2UNWp3cB7mW4ZDjVQ8mjHvhsvP98aqZNkP/eK
         xAs4DXLB1lXhkpyXFKYgz78d0LYl2OYSEc3XdQE9OEUvE1dSfFYdJuVqTXqktiTKOaMN
         Bn9A==
X-Forwarded-Encrypted: i=1; AJvYcCWwJ64d8kZ1jx4/fu4KMQzJ7yik/Sx9lDRp0aI4Pxtgq9rlZVq7D9mHcx7QG5fc0es+xrerBbCiesifeNKJB/Gdf0elRYJSgFSbxOQguFJLew1Y6uljwQwsm2ryTa7NZpTP
X-Gm-Message-State: AOJu0Yy7aFPkOzFCypfaaZPxdBgHabwvTzTVlfKEE9QmQ9/3qss0cFYH
	2Ih2bRs6EZAsEpjIcejuelveVrNM48Xt3WaxJkAhrIG5Ao/tmpMn/ZtjzjITRmM=
X-Google-Smtp-Source: AGHT+IGK06jDPpoGN+gHQFadLmx+eBa/qaer8EaFUZLQyYJ6p1SkWfbUGw/3FYKgwO8yghpq2luJGQ==
X-Received: by 2002:a0d:cc88:0:b0:60a:1efe:2e7a with SMTP id o130-20020a0dcc88000000b0060a1efe2e7amr874825ywd.6.1710403078355;
        Thu, 14 Mar 2024 00:57:58 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id z80-20020a0dd753000000b0060a048aac3fsm172858ywd.96.2024.03.14.00.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 00:57:57 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-60cbcd04de9so7169347b3.2;
        Thu, 14 Mar 2024 00:57:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUudnKGe4wgjkukDPnH55dAKqgqKfAMQmJE7jhGNxUReCHE9k5DXN9esAfDsatSMk1g38ov3tjT6ctHb7zYuYA69FVy63y0EEsd/iOpPsux9xQXJG3OvyaRV3xn/4MnGMfg
X-Received: by 2002:a0d:ea4c:0:b0:609:239a:d0fc with SMTP id
 t73-20020a0dea4c000000b00609239ad0fcmr990474ywe.38.1710403077141; Thu, 14 Mar
 2024 00:57:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240312170309.2546362-1-linux@roeck-us.net> <20240312170309.2546362-12-linux@roeck-us.net>
In-Reply-To: <20240312170309.2546362-12-linux@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 08:57:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXHKfd8agPGx+MjvC4cjW5F6DEeVec3Moe-=LLkrT3CXQ@mail.gmail.com>
Message-ID: <CAMuHMdXHKfd8agPGx+MjvC4cjW5F6DEeVec3Moe-=LLkrT3CXQ@mail.gmail.com>
Subject: Re: [PATCH 11/14] s390: Add support for suppressing warning backtraces
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

On Tue, Mar 12, 2024 at 6:06=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
> Add name of functions triggering warning backtraces to the __bug_table
> object section to enable support for suppressing WARNING backtraces.
>
> To limit image size impact, the pointer to the function name is only adde=
d
> to the __bug_table section if both CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBO=
SE
> are enabled. Otherwise, the __func__ assembly parameter is replaced with =
a
> (dummy) NULL parameter to avoid an image size increase due to unused
> __func__ entries (this is necessary because __func__ is not a define but =
a
> virtual variable).
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Thanks for your patch!

> --- a/arch/s390/include/asm/bug.h
> +++ b/arch/s390/include/asm/bug.h
> @@ -8,19 +8,30 @@
>
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
>
> +#if IS_ENABLED(CONFIG_KUNIT)
> +# define HAVE_BUG_FUNCTION
> +# define __BUG_FUNC_PTR        "       .long   %0-.\n"
> +# define __BUG_FUNC    __func__
> +#else
> +# define __BUG_FUNC_PTR
> +# define __BUG_FUNC    NULL
> +#endif /* IS_ENABLED(CONFIG_KUNIT) */
> +
>  #define __EMIT_BUG(x) do {                                     \
>         asm_inline volatile(                                    \
>                 "0:     mc      0,0\n"                          \
>                 ".section .rodata.str,\"aMS\",@progbits,1\n"    \
>                 "1:     .asciz  \""__FILE__"\"\n"               \
>                 ".previous\n"                                   \
> -               ".section __bug_table,\"awM\",@progbits,%2\n"   \
> +               ".section __bug_table,\"awM\",@progbits,%3\n"   \

This change conflicts with commit 3938490e78f443fb ("s390/bug:
remove entry size from __bug_table section") in linus/master.
I guess it should just be dropped?

>                 "2:     .long   0b-.\n"                         \
>                 "       .long   1b-.\n"                         \
> -               "       .short  %0,%1\n"                        \
> -               "       .org    2b+%2\n"                        \
> +               __BUG_FUNC_PTR                                  \
> +               "       .short  %1,%2\n"                        \
> +               "       .org    2b+%3\n"                        \
>                 ".previous\n"                                   \
> -               : : "i" (__LINE__),                             \
> +               : : "i" (__BUG_FUNC),                           \
> +                   "i" (__LINE__),                             \
>                     "i" (x),                                    \
>                     "i" (sizeof(struct bug_entry)));            \
>  } while (0)

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
