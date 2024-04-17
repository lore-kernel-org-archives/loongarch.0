Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D32D42A93
	for <loongarch@lists.linux.dev>; Wed, 17 Apr 2024 07:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713339190; cv=none; b=acQ3RhJUoBkq9hilTCv45ePIc19u01cftqOy4AFRB0RiE6YSP6ysfxZQ33l6J+wHYfklN/u3ABcO1JFRFgXcR4EX0H8DHGzoIh5vFqAXYnV7ylksnWJMDmWs95cg11jXqEP+kITEPeLcD2qnp0RJJNGsPRqBPH4XdYxXFSP3xKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713339190; c=relaxed/simple;
	bh=4M/fw1i0ckKST1BwB3ODxPa/j8j1yo4JskODZf2vzNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sk7KSZR4fDWheJaDTO9mx/DltLvYc1RHZpgmsRrq8zpYcExJN7qiyGvKZ+IZiCBGXtFQ+AIuY32OC4cVm4tpzyFKWMLZfMBq4PKk4ufbibdreYHcyWnokD59LnDEF+7mLOEpCA9CcB11dO22cBL7v101jIHVzKG39NPSytJ5PhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc236729a2bso5064779276.0
        for <loongarch@lists.linux.dev>; Wed, 17 Apr 2024 00:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713339187; x=1713943987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RWT+JVEfiwxFQ2uS0czPJ+Qjk2ZoL23ti+eoi7gGfk8=;
        b=FKUGPIUPPCfV/mhHCTqbILF/dRJaW7s/wtXlgIBGYWg3Z5QfmGIFI8fkVsFcEGSxMl
         B6SaewVb6gLGgK7FpQou4/QHXsEqjwb13IDqFnm7ZNC8xvxCR4/GUoTSgac06K5+7/OI
         iEOmBdtOX5Sw5qj0vB4ryV2aehhhLOOddclb429zTH+dx86/FnRPKVFTWJcZS2W4slSx
         0MlBxKwWIDMTfc7+2LqV9HyA7mpwekAKUGIP1MNNu+xgop89uJdwJAcj9CYphVC2rBnM
         Nurnbqvon/RQ5Oq8X98S3vQQYRO6PyOIXTF8MMwa/6th+wDJC5lyt6duEA2QY0q7fbC4
         5ofQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2k8E8s3BeTjTNDQugnobK76Hn4wohTmWkPhh4aSg241d7L3Ag1k4b6k2MsT3GGNmIRejO15T9TRo5MsVWHHm5BZQNwe1fRHxc
X-Gm-Message-State: AOJu0YxdbH8jS/QMgR2GHeUslzPdM+8WAtOlRa/y687JVoHjAn4NpWLY
	AbEFouRD95/BOHzoE6bp/qqyFfhb1nM6gJdhkKbRPQEGWxGdYTCsF/UmD4KE
X-Google-Smtp-Source: AGHT+IEdko+QOjtyh3emr4/wuzFX9UNHspNDFL3Y55hO9qcsqVuEr+Tu3JOVrrbOonqe09Ig3LjNPA==
X-Received: by 2002:a25:be50:0:b0:dcd:c3ba:d788 with SMTP id d16-20020a25be50000000b00dcdc3bad788mr13704981ybm.47.1713339187606;
        Wed, 17 Apr 2024 00:33:07 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id g6-20020a25ef06000000b00dbf52d2844bsm2770137ybd.11.2024.04.17.00.33.07
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 00:33:07 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-618944792c3so47097837b3.1
        for <loongarch@lists.linux.dev>; Wed, 17 Apr 2024 00:33:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdh567crvmS8fjjqEuSUyQHt0EqbxSHe3MYwX2Kc7mJymhLp9ssdN11GPDl8ZcMXUx5tCOHIf1U2C4+DXCrA8RFXrRS9bTqeqf
X-Received: by 2002:a05:690c:989:b0:61b:97c:5ffa with SMTP id
 ce9-20020a05690c098900b0061b097c5ffamr866589ywb.22.1713339187177; Wed, 17 Apr
 2024 00:33:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240329132825.1102459-1-bhe@redhat.com> <20240329132825.1102459-2-bhe@redhat.com>
 <CAAhV-H76-FOvcTXB_rW1B1wFthYK6txVtC+brfzk6nwOhar8iQ@mail.gmail.com>
 <ZgggcyeJ1bnkfGOp@MiWiFi-R3L-srv> <CAAhV-H5xGDAkF2kjdveKoGd+GwYrmix8_E=YB0i=c98qOGvffw@mail.gmail.com>
In-Reply-To: <CAAhV-H5xGDAkF2kjdveKoGd+GwYrmix8_E=YB0i=c98qOGvffw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Apr 2024 09:32:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrFPJQ2B7-SBCq-m7tU9twKYwyH+0Czy-zB_n2F=VwrA@mail.gmail.com>
Message-ID: <CAMuHMdVrFPJQ2B7-SBCq-m7tU9twKYwyH+0Czy-zB_n2F=VwrA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arch/loongarch: clean up the left code and Kconfig
 item related to CRASH_CORE
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, akpm@linux-foundation.org, 
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 5:15=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
> On Sat, Mar 30, 2024 at 10:24=E2=80=AFPM Baoquan He <bhe@redhat.com> wrot=
e:
> >
> > On 03/30/24 at 09:59pm, Huacai Chen wrote:
> > > Queued, thanks.
> >
> > Thanks, Huacai. While I noticed Andrew has queued this patchset in his
> > mm-unstable branch.
> If I'm not mistaken, mm-unstable is target for the next 6.10, not for
> the current 6.9. But I think this patch should be a fix for 6.9, so I
> think it is more suitable in the loongarch-fixes branch. What's your
> opinion?

This would have been slightly more obvious with
Fixes: 85fcde402db191b5 ("kexec: split crashkernel reservation code
out from crash_core.c")

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
