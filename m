Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4084C23AF
	for <loongarch@lists.linux.dev>; Wed,  3 May 2023 08:09:54 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-559e317eef1so59867537b3.0
        for <loongarch@lists.linux.dev>; Wed, 03 May 2023 01:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683101393; x=1685693393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SVmNF978sXXspcYjjZLpiBDqyot8IfsoBtpE1ZoRNc=;
        b=jHqEeBTZK+tK3ZAZ4b2Q9iAz9sGSRdARCn4ZZbDhE1VWTdy/+6lih9pEeUi0l55hW4
         Jj38CxGf0FsN/F7XKiXXeLmnbkFTt7ZV55sLWAwHJwWArX0/v21t6TCDSf7qD9o3Tf7o
         3l5x8Fn+CWGkAkQ67BazKpynV65tOVZnp9eRaxq/I7E4z1zhwzzZpNeCeXTx4nHMn9jl
         5m5ZmSaZ1mnkC5Rz3aVtLzHF0tNcWmdTpDgW9NB5rkfVc4gAYkY2Ad16N1brKF6801nf
         NEzu281ADsexLDej3KXryhsUj3AlsyVGelNhJXIoo/maMh6n8UtRU3o39AU3qi8Y1DyS
         MW4g==
X-Gm-Message-State: AC+VfDw+y7oGjyzY302WzcyMw5ykfpYLnCLAiGMSk1c7gvnEIXQ8SGrS
	m3MR/mNyYPWAleAenUmKOd/+u4PYwIJXww==
X-Google-Smtp-Source: ACHHUZ5GtJBWE2UnkDjDqTfnDtx86T+32o/v0lvFxMHss4uHM/neo6iZO8xYi813rz20RM/HG51haA==
X-Received: by 2002:a0d:ca50:0:b0:55a:6d87:6431 with SMTP id m77-20020a0dca50000000b0055a6d876431mr7972747ywd.26.1683101392822;
        Wed, 03 May 2023 01:09:52 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id h7-20020a0dde07000000b0054662f7b42dsm8430943ywe.63.2023.05.03.01.09.50
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 01:09:51 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-55a2cb9788dso48012677b3.2
        for <loongarch@lists.linux.dev>; Wed, 03 May 2023 01:09:50 -0700 (PDT)
X-Received: by 2002:a0d:c347:0:b0:556:dd1b:3bb7 with SMTP id
 f68-20020a0dc347000000b00556dd1b3bb7mr19301020ywd.43.1683101390642; Wed, 03
 May 2023 01:09:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230502130223.14719-1-tzimmermann@suse.de> <20230502130223.14719-5-tzimmermann@suse.de>
 <20230502195429.GA319489@ravnborg.org> <563673c0-799d-e353-974c-91b1ab881a22@suse.de>
 <87354dyj9i.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87354dyj9i.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 May 2023 10:09:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW8Sm7sBu47XQ1xygn6fzq2FzQeiuK0ncMVGHan-_k4Ow@mail.gmail.com>
Message-ID: <CAMuHMdW8Sm7sBu47XQ1xygn6fzq2FzQeiuK0ncMVGHan-_k4Ow@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] fbdev: Include <linux/io.h> via <asm/fb.h>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>, linux-arch@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, arnd@arndb.de, deller@gmx.de, 
	chenhuacai@kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, James.Bottomley@hansenpartnership.com, 
	linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org, 
	vgupta@kernel.org, sparclinux@vger.kernel.org, kernel@xen0n.name, 
	linux-snps-arc@lists.infradead.org, davem@davemloft.net, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 3, 2023 at 9:19=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
> > Am 02.05.23 um 21:54 schrieb Sam Ravnborg:
> >> On Tue, May 02, 2023 at 03:02:21PM +0200, Thomas Zimmermann wrote:
>
> [...]
>
> >>>   #include <linux/console.h> /* Why should fb driver call console fun=
ctions? because console_lock() */
> >>>   #include <video/vga.h>
> >>>
> >>> +#include <asm/fb.h>
> >>
> >> When we have a header like linux/fb.h - it is my understanding that it=
 is
> >> preferred to include that file, and not the asm/fb.h variant.
> >>
> >> This is assuming the linux/fb.h contains the generic stuff, and includ=
es
> >> asm/fb.h for the architecture specific parts.
> >>
> >> So drivers will include linux/fb.h and then they automatically get the
> >> architecture specific parts from asm/fb.h.
> >>
> >> In other words, drivers are not supposed to include asm/fb.h, if
> >> linux.fb.h exists - and linux/fb.h shall include the asm/fb.h.
> >>
> >> If the above holds true, then it is wrong and not needed to add asm/fb=
.h
> >> as seen above.
> >>
> >>
> >> There are countless examples where the above are not followed,
> >> but to my best understanding the above it the preferred way to do it.
> >
> > Where did youher this? I only know about this in the case of asm/io.h
> > vs. linux/io.h.
> >
>
> I understand that's the case too. I believe even checkpatch.pl complains
> about it? (not that the script always get right, but just as an example).

One more to chime in: in general, drivers should only include <linux/foo.h>=
.
Including <asm/foo.h> directly is the exception.

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
