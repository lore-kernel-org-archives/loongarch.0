Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC8D45FFC8
	for <loongarch@lists.linux.dev>; Wed, 16 Sep 2026 08:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547315; cv=pass; b=BEGYtzBlnW7k/HlWhOaZhO0FJsCmoK7GCKw//5IWxmI+kYMpDfBN7FIryrKjOY89bFFdEAmOGeraVw9gGOdMqHymqlXAjSTGTZMhyJocyl8jtEsscuF7iOdew/utUJcZ9gwdSvfDMN4+xfMk3bsfplc2QWxwJ2WE+kgTAMpa4/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547315; c=relaxed/simple;
	bh=T9FXw02kbHJEl+ZSBnKkmAGVnRlakuQY/1vtyQfdaEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hq97kBIfb4QGjRcOUgTWLMtpRfznABbNdPBjpwIZKPUBb3pjWXz5oiaXxC+R14oEX0fO+QEhUCbVmXHiS1IblyVU/1ld+xkXZ11bNOEMwjmPWgWgmntdD1V2OCl4WEEByNsRiv09MLm4bIN/eYT2ZAP0sURhAMWqu6uMVYKwZBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hslFkpWG; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hslFkpWG"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982e8fa91d3so124384241.1
        for <loongarch@lists.linux.dev>; Wed, 16 Sep 2026 01:28:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789547310; cv=none;
        d=google.com; s=arc-20260327;
        b=Zg1stqjqyge67/PARE88c0HD/rWTAVPESOcip1um+ekkup3pTaQxsbXtQ8wFzFcpAX
         TH1jugaqhBRm7RT/bwegI801cL4Ilg8FP/hRNn4aeibcD1J1I19QUwttnUbRUtNkSrET
         SWPIT7oq8YkhM7rh9byWeV7IZjJKRhOTrD5jPyJbS8L0i/gokdz+Gw36OwVghl/hVo7Q
         8p6OMuIJoWgbXCOOLatLBtmHqS5hjSuvYgaq3jXfVaeP0PWUYT3FA3N5gJY/A5bVY84x
         R7Z1rVr+qI7s/A+cwofBONI+6MiBRihT3GndxeGVtgyaNZXVZq8ieUsW6LJWesaipFKP
         w2lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MArIcxEq1DF3tM6gYQ8CgYvDf8FqlVp7SuT0GyZ8Xuo=;
        fh=eXNvSd/sAiniMrEzNGc/a34HxJvvV9i6dl9zr3Qjsqw=;
        b=Ncw82zm1Wd2nTePPnxoH6/AoE6oLUc5ytTiiHqjf9rSwNqP2U6MKN1DfTeLn4WpiuD
         hier+G8sgD9TbRVWHyK16/MwjInh/jE+Kzx5DyQv0snMY03hWJQUpy/IEN0e/yuAU4AA
         1Yi+mRpnw6SQjl0kIpFKgtptIrNVzLx3wl7QaG9rj24A3uhybMTy9mc2EKPkyDxlqWoF
         xD80iN7fH0ppzfHNhhQooDUl4WVwMkIcuV/iUaJH8hRgdQA+c5zQ/ngYKe6hrw7UO7XT
         m9i+V2PN3fnfYz4jD0c4I0qRNeIpIKRyWwoZgS47EjWkPpsKJ6ACO7A9LQ3oYnvOrqX8
         QH+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789547310; x=1790152110; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MArIcxEq1DF3tM6gYQ8CgYvDf8FqlVp7SuT0GyZ8Xuo=;
        b=hslFkpWGEVcn+k4sMZSZAN3OnNdLxnRdviewDE6H1s4o7NuMg6x9tQ/4cSHyAYenxm
         SXpBMHr4ainQNlVFEmQpjpjnFq7vYtnymTmnrL+7JsO4ZBvz94bFLJwtFiyF722rgjIb
         gajdGFGEDUl8Z5FXjdo5Ql6u8CeXCaiGUAIOhsrGd+zbBZoK3WB3i1xqlb48E+Cw+5yw
         THkGftl6OekM4WPzGiB0RoWRK1Y9XE+c5qdBi29cx6y1vCnY31z7R9xtzf47peDm+e50
         yMGN5eu1aR51gPpgURVAaTM0AnvFuAt9KEoFyaIGY8+48KNN78sFzmftk7J4eqVAdS+z
         upug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789547310; x=1790152110;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MArIcxEq1DF3tM6gYQ8CgYvDf8FqlVp7SuT0GyZ8Xuo=;
        b=NjxSCQi6IDMfRNHi4h8uTuW6DsRXaevXDwidWXytzmChmks3AGTHGd8/Ohia9yrcw5
         rQg+RYC7UclpInW+O3DeqEMyXD4lSATdcl0rWsX/Wn4GYS67AtYKwLVB3U3bdwA//VXI
         RvDmgneDoEs3nfXb/GygX7jDbcZapiIPlXS05CnJA8fVHRKDpZOpCE6gAGG1YTuZSnf7
         KgmnucPKMrS16hrp/kkchJ5fnRJmFOTaMKKLxRUH51m09//4905oX5gZZShnwaGEGrJk
         Mu0kBpiL7woofMaGHg7fCgGjZH+/Uy3h7WphMvFeZ9lEKMzRYAoHou/Yo9hVoQU1QeTi
         3qWg==
X-Forwarded-Encrypted: i=1; AKwUvBzEoEM/cOy0BM3QbhoPysf59mOVyFo51IdQ7R5tEsqp0ifjgXrQE8euyTLDf1TEEOhp3vVRxBy/vgk=@lists.linux.dev
X-Gm-Message-State: AFuF++nrMvJydk3bcL84iloPINCOD9QLrF3Aebqu29UFFulLrJQOGp6U
	OeSqtzMPJrW6CPYkIDbzAZCvrO3S5rOV+eHE6efIqcJ2PQydMBUAqBY2THeEdahk7wOOMtis8/Q
	M0JR1eBHwT9S6GkbpjjqQhnwFTeFxtKDBXYF/dM0=
X-Gm-Gg: AYBFou3oN+WXZ6h8mxKgS5Rq7bWdw23A9g989WxaqsLWZQd7J+85twvs/op1RMkAWce
	cd2PRxTNFDz8NxufJdlsACF0tmGl6NkPsMo5Q9M5T7IRp2WdSLKGthCKcdhSq8UfU7+xT6OHFjO
	m8KC9ibrsOBbdblEsMldtUeIT5kIsk1tiPicByB2LRk1yGr8rr4Nl8j9FJaJ45VChWAJjVc4mc4
	+UwSc+ff8EWu27yFqwDVXEDHZuiLdbPOQqCi2zd2dyWO5qfjN8UwOfoDrGI0WtyywWtL7VTyWml
	91HuE+foK6+/YniDRDJy3uppaT5giiEYVsK5qwXYUQGY/LiFhzzBke5lq6m9Ew3Gt1rgcpEDRnM
	qH7Fx8sN5SvGt/rMONK76
X-Received: by 2002:a05:6102:3712:b0:786:a11e:484d with SMTP id
 ada2fe7eead31-7a0522a8290mr540435137.6.1789547309631; Wed, 16 Sep 2026
 01:28:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915081910.4142719-1-morbo@google.com> <20260915081910.4142719-4-morbo@google.com>
 <202609151155.CC22827@keescook>
In-Reply-To: <202609151155.CC22827@keescook>
From: Bill Wendling <morbo@google.com>
Date: Wed, 16 Sep 2026 01:28:13 -0700
X-Gm-Features: AcwNN1W06HBvxyPAyDNMWJbd-pZRzg8rOuNuZoGljznF0BEtCKl9YZ-3dIsOV-o
Message-ID: <CAGG=3QU2LxKLdqTOHse4U9AZ3sGAUe-C_wbDnBq4W1ncdsPVwg@mail.gmail.com>
Subject: Re: [PATCH 03/28] ARM: atags: Replace strlcat() with snprintf() for
 cmdline extend
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, codemender-patching+linux@google.com, 
	Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ian Abbott <abbotti@mev.co.uk>, 
	H Hartley Sweeten <hsweeten@visionengravers.com>, Tony Luck <tony.luck@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Matthias Schwarzott <zzam@gentoo.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
	Anil Gurumurthy <anil.gurumurthy@qlogic.com>, 
	Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>, "Martin K. Petersen" <mkp@kernel.org>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Jiri Pirko <jiri@resnulli.us>, 
	Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
	Tom Talpey <tom@talpey.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Kanglong Wang <wangkanglong@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Qiang Ma <maqianga@uniontech.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, Ard Biesheuvel <ardb@kernel.org>, Breno Leitao <leitao@debian.org>, 
	Thorsten Blum <blum@kernel.org>, Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lyude Paul <lyude@redhat.com>, 
	Ashutosh Desai <ashutoshdesai993@gmail.com>, Imre Deak <imre.deak@intel.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Johan Hovold <johan@kernel.org>, 
	Johannes Berg <johannes.berg@intel.com>, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Cryolitia PukNgae <cryolitia@uniontech.com>, Jiaming Zhang <r772577952@gmail.com>, 
	Will Porter <mrwillporter@gmail.com>, Cen Zhang <zzzccc427@gmail.com>, 
	=?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
	Rong Zhang <i@rong.moe>, Arun Raghavan <arunr@valvesoftware.com>, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-edac@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-input@vger.kernel.org, 
	linux-media@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-nfs@vger.kernel.org, devel@lists.orangefs.org, 
	linux-hardening@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 12:00=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
> On Tue, Sep 15, 2026 at 08:18:20AM +0000, Bill Wendling wrote:
> > --- a/arch/arm/kernel/atags_parse.c
> > +++ b/arch/arm/kernel/atags_parse.c
> > @@ -121,9 +121,10 @@ __tagtable(ATAG_REVISION, parse_tag_revision);
> >  static int __init parse_tag_cmdline(const struct tag *tag)
> >  {
> >  #if defined(CONFIG_CMDLINE_EXTEND)
> > -     strlcat(default_command_line, " ", COMMAND_LINE_SIZE);
> > -     strlcat(default_command_line, tag->u.cmdline.cmdline,
> > -             COMMAND_LINE_SIZE);
> > +     size_t len =3D strlen(default_command_line);
> > +
> > +     snprintf(default_command_line + len, COMMAND_LINE_SIZE - len,
> > +              " %s", tag->u.cmdline.cmdline);
> >  #elif defined(CONFIG_CMDLINE_FORCE)
> >       pr_warn("Ignoring tag cmdline (using the default kernel command l=
ine)\n");
> >  #else
>
> It's pretty clear we have a pattern of "simple append" that is needed,
> and while strlcat() does that, it's horrible. I feel like we need an
> appending scnprintf(), and it needs to return like strscpy() does (i.e.
> -E2BIG on truncation).
>
> My goal would be:
>
> - don't open-code string length math
> - never leave the destination unterminated
> - allow for format strings
> - yes/no return indication for "did this truncate?"
>
> Initializing a whole seq_buf struct for these small cases is too much
> overhead...
>
> For both cases (small without seq_buf, large with seq_buf), it is also
> frequently needed to know the resulting strlen. seq_buf doesn't do this
> right today, and a strscpy-style return value also doesn't tell us. :(
>
Something like "llvm::Twine" would work well for this.

-bw
