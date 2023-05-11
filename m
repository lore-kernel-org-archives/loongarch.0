Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1901F931
	for <loongarch@lists.linux.dev>; Thu, 11 May 2023 13:10:59 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-55a20a56a01so153603517b3.3
        for <loongarch@lists.linux.dev>; Thu, 11 May 2023 06:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683810658; x=1686402658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFpq6TfFDkhgvBTK4lDV32kTv2wLv5jHDb1iGqYi2iA=;
        b=XT56WN2p1nP6euoosvKvbXBTCqpmQSfVybhCGIn8tVlkTM2EUstNELvFrRmnOFICFf
         xumm0mBSYgl4bA/tTdMAR1yeNTkNbubfaQH501jO2e6HrbEGficfYMfqwKB1eiJofMqR
         ZoNDytcptmn/Jz/Lh0CE3/E0F6ih/+1qGRXw9u0D4gpscYucBSgWnl1dNemIzHxAJ4wb
         M7U7E53MPhV2PCo8PvEgIMTibW2FRml+n1LWC0jd3YMJV0SHEG7AugXdlJ5v5Riensjp
         IBUH7Ba70kiTvfj8Gxg8vFFjCLXGSRz7z9TzwsbfU71adm17e22Ta8psfJgbgHO06tCe
         pPPQ==
X-Gm-Message-State: AC+VfDzBk4U+Vc0rf3vO9JWlTHIMxlH5nEFko6XXXpIWwbVS2uTn/ZA7
	J4+PaWemQvgGZBzQ1B9SyT1tj2bfnhh7pg==
X-Google-Smtp-Source: ACHHUZ47rf2Awe1D0RxZmvE33ab3Zi1Ydh8e8ybtjphiDiiNDbojwHI5rPbePQ7oOJRjdASl1JeOyQ==
X-Received: by 2002:a81:4a8b:0:b0:55d:bcf0:50eb with SMTP id x133-20020a814a8b000000b0055dbcf050ebmr17118510ywa.38.1683810658114;
        Thu, 11 May 2023 06:10:58 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id o138-20020a0dcc90000000b0054fb931adefsm4906782ywd.4.2023.05.11.06.10.54
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 06:10:55 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-55aa1da9d4aso153657067b3.2
        for <loongarch@lists.linux.dev>; Thu, 11 May 2023 06:10:54 -0700 (PDT)
X-Received: by 2002:a25:3792:0:b0:ba1:e7bb:a3a6 with SMTP id
 e140-20020a253792000000b00ba1e7bba3a6mr17227303yba.18.1683810654067; Thu, 11
 May 2023 06:10:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230510110557.14343-1-tzimmermann@suse.de> <20230510110557.14343-2-tzimmermann@suse.de>
 <0e13efbf-9a48-6e70-fdf3-8290f28c6dc7@189.cn> <a2315b9a-0747-1f0f-1f0a-1c6773931db4@suse.de>
 <15fe1489-f0fa-bbf6-ec08-a270bd4f1559@gmx.de>
In-Reply-To: <15fe1489-f0fa-bbf6-ec08-a270bd4f1559@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 May 2023 15:10:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8piLhEbV+pcWvdn1OEGH9N5FwDOQcqNcEjBx3=ThjXA@mail.gmail.com>
Message-ID: <CAMuHMdX8piLhEbV+pcWvdn1OEGH9N5FwDOQcqNcEjBx3=ThjXA@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] fbdev/matrox: Remove trailing whitespaces
To: Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sui Jingfeng <15330273260@189.cn>, javierm@redhat.com, 
	daniel@ffwll.ch, vgupta@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	davem@davemloft.net, arnd@arndb.de, sam@ravnborg.org, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	sparclinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Helge,

On Thu, May 11, 2023 at 3:05=E2=80=AFPM Helge Deller <deller@gmx.de> wrote:
> On 5/11/23 09:55, Thomas Zimmermann wrote:
> > But the work I do within fbdev is mostly for improving DRM.
>
> Sure.
>
> > For the
> > other issues in this file, I don't think that matroxfb should even be
> > around any longer. Fbdev has been deprecated for a long time. But a
> > small number of drivers are still in use and we still need its
> > framebuffer console. So someone should either put significant effort
> > into maintaining fbdev, or it should be phased out. But neither is
> > happening.
>
> You're wrong.
>
> You don't mention that for most older machines DRM isn't an acceptable
> way to go due to it's limitations, e.g. it's low-speed due to missing
> 2D-acceleration for older cards and and it's incapability to change scree=
n
> resolution at runtime (just to name two of the bigger limitations here).
> So, unless we somehow find a good way to move such drivers over to DRM
> (with a set of minimal 2D acceleration), they are still important.

DRM can change resolution at runtime, just not through the fbdev API.

Or do you mean the resolution of the text console, akin to
"fbset <mode>"? I have to admit I do not know if there is a command
line tool to do that...

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
