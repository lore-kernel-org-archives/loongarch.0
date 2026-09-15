Received: from mail-vs2-f35.google.com (mail-vs2-f35.google.com [74.125.227.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B831426D13
	for <loongarch@lists.linux.dev>; Tue, 15 Sep 2026 19:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789500652; cv=pass; b=UzOHtkQ9wgXvTXki0+9nRskfPoGzmxW3g802+ZQpaRL4e1d9/amD0WQArxBZ62TJ22pslxn71IRq72siAlZILWeqCc6nG6/m30KpN2isxk3Ha9loWajEgqYTQQNmhQJdZl1S59cJa4/3U6J0WXc7JG9dg0lil9H0GZ9pkO6JR+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789500652; c=relaxed/simple;
	bh=RfxsKW+gWzHzPnl0VGV4sp1JrOew5XduTAso8G35GXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z0nUDXH/KhynoC4YN3YzUmzf1KJfhcN8Cq12mhLUAT6l2wpL7G961iJN5ERDD3/7Vq99IzIojAyuvWvmd9uiRl4V/WHPN35iojIAFMwCvgbXdUYdq6pKa4qI0dN8Byei1Mt29o6lUYksIlUlZMwySGIAO06aCQwyCPvZTwuxZFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FKWJYui/; arc=pass smtp.client-ip=74.125.227.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FKWJYui/"
Received: by mail-vs2-f35.google.com with SMTP id 71dfb90a1353d-5c67e504d59so53876e0c.1
        for <loongarch@lists.linux.dev>; Tue, 15 Sep 2026 12:30:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789500649; cv=none;
        d=google.com; s=arc-20260327;
        b=MdiF6nImWkNUwIcYD7k1LyDNE43gSljlMIh2LITyLSpBOwnBoumoULM9AVIAXL16I/
         nZ99PNVOEA7op/HGXQx5gTQfpBO50bnh+4yrPuTyiWhqbt9L3W+cpV2YAkfgJpEHZ6Fy
         B/zUtRDS8WjbcQ08IFNkPbw4Rm+tbr9L5JmqXljb0FTCGr8E8JU1lbeZfi+HRSXyrf1L
         NkehXa2cLwqgapGYG38cp612UKbPMUEvVSl8kJwLDlIXrV/ipD3A5qUMYX5+GGlzAJB5
         1Ek4BvXbvc1+KoprFQ8v91MNm0VzCqYWNRNYz50ZzvUj0trVoVROW83Z4CecKNrBrQX+
         +KqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bRLtXj28C7ZetbPCXePmHpMel3/nm53ij0hFxwsbjIQ=;
        fh=2eiN03jeZPUXmMuI6lhpevOshPIlQDLyHK0g7p1dEzQ=;
        b=djAp1y2r0OLYa4/hpDy3k81dH5MP4YhPv2wROxiC0i+O1aCISDUnrWeNwgla+WuvEp
         uQ8rK1y9K1DyiDZuk+dvVzyeFa4qNgCoktvSbBZ9LfVuA/3e7HFyckG1FnkttNVVSQAt
         xFxNaZjER+8a8eHmg0gycvjUqGxbXuZgifYsVrsJtIIssovqc+Hq2QqedJkUPLQhfNjC
         fB065v06DLCa0L757Ozr6ywtPOVyGOc0DsMS3rOBK8YmRJNmaM9Ld1f+a7xCByQXVFWP
         zo2TQc3ZIc0QiI1UVouWcMwJBbpd6ax9k47kiWppWqW3Gvnfh240spdyiV1dn46sRAGe
         bz5g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789500649; x=1790105449; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bRLtXj28C7ZetbPCXePmHpMel3/nm53ij0hFxwsbjIQ=;
        b=FKWJYui/jdkYj5Ij4Nn9iE0ZZnWyIEQeO0Wl4EXnCzg8xo+4cG7fIPU3RkCgu6ucxz
         4Qdv/SX3XVoQsB6twYCr8ufqNh4E3BWAwnLifeO/0ictp7n/YWwcm5LGsyyek/3yY8DW
         jg8Hm8M4v3PPlP5tlZhLQZkuVaTZfIGyoBflmVOomneUhmMiiRzXB2hVfySxaZKkkOJh
         L67T7rbqfnOrviZD4m88M13bOVf2/F3DG1JPKX2/+VoOl7gB9EfqvSu/jPOfQReIJTH6
         KjetfAjEilBaLICZplkTJ+XuQ/XPWBQIbNAdM9p2VHEo5BP8g7aU17HivAVsdbwNkESu
         jxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789500649; x=1790105449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bRLtXj28C7ZetbPCXePmHpMel3/nm53ij0hFxwsbjIQ=;
        b=DQuiz5hkQNt/hsqIFAxQPlPKQYwIX7g+A3iMs4VMS7y7hA8dwVvPjwYhSCn1hF1uoN
         kfQjCujrXStT0VcwKJ2+hht6PCbBpXlU4dW+lpZydbJ/mnEK4oXn74pyuCMFAMnt6f1K
         HmNWn35zSt7o9kP5qrHdBDzbsAlQjLOmEpyTsxTmbXG4VThDcoGdqxHwZ+/QkbiGgWFe
         kOFgma/JYrZDjZw279ZRu+4A7iWhA5uxgJIeTSkjvK4iX5z70hbL1Qtwr3qrVejFsbtZ
         RYBGwoTm7PxpIkIWxCkaVFY3tr4wSgd09aSi1aJqyEsibgXmVvklQD6HpIAtG0wmrBed
         8MRA==
X-Forwarded-Encrypted: i=1; AKwUvBy9bHWvcPLqQjL3sl8tYfz0MYDkEG7EsKnt9aJ7+Riiilem7s704j3MAXT4huHJ9AyPN0xz6ppQ1xM=@lists.linux.dev
X-Gm-Message-State: AFuF++lTsh1zXliK3dealCB1plwQdlObuLD0WYagb5kgxwwvhtj9y6Sd
	KTdhMp3eL/hBkpi2ybVQ5EsUe2a2VbMMrH6ud1k4+QQ/BJNjrRPiGSEvVtc3AbB6L+tYtMzATRU
	KbYWrlRWHb6+03WFONmLZIKOfy1QEghj1Luc/27w=
X-Gm-Gg: AYBFou1P4lNetMMz2W/BLgomz4Fr6D5Ss+Jvh85bphyuvaqxq0jPtwQb2U3H5Odzosu
	tGNOOZfUq+kHnJCPQpB2GGYdFa7HQsSw45+cRk7RNUlGBtgU9zC1xqL36VvaYwOVs3jMEhfQeNx
	kFPOvWB4+DQpGY20DcwZ9DiRy7HpfrXaQIkaHPbA2INPXdgTlMbEQqs5Hli8noeDmG1taunmD9z
	08fXwyA9RE/IhWHyOp6fNhMx6bSnOp92kB+y0wiwFkoyVKdZyCZ1dsr9zbYGoYmnCw5Dc8s+5cV
	4X3pWNHAFaTeWVKUB8hor3dOoQlmAq/a6wiZ6nZkQ7TEhV73O2E3EvQt51wdmr/2cKikGBFFH2G
	nrSoXW8Q/pmcstfJeVD+lAXw8v0NdYSTx0FuUiPd//81nhM1tpi1vZpy78hE2vQ0=
X-Received: by 2002:a05:6122:8d4:b0:5c8:3697:9289 with SMTP id
 71dfb90a1353d-5c993b49b7cmr4231155e0c.8.1789500648289; Tue, 15 Sep 2026
 12:30:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915081910.4142719-1-morbo@google.com> <20260915081910.4142719-22-morbo@google.com>
 <202609151147.C5B45CB@keescook>
In-Reply-To: <202609151147.C5B45CB@keescook>
From: Bill Wendling <morbo@google.com>
Date: Tue, 15 Sep 2026 12:30:31 -0700
X-Gm-Features: AcwNN1W7vYosDgc2DMy2_OinBNj1qeEQ35WOY6PL8-NHlzjaHMOKmE1leyIGWNs
Message-ID: <CAGG=3QXYtmJqE5oy5ZD0-G0=GNxK71KKYurusNJvLQNqR-o6+A@mail.gmail.com>
Subject: Re: [PATCH 21/28] NFS: nfsroot: Refactor root_nfs_cat() to use snprintf()
To: Kees Cook <kees@kernel.org>
Cc: nikitash.mariiaw@gmail.com, linux-kernel@vger.kernel.org, 
	codemender-patching+linux@google.com, Russell King <linux@armlinux.org.uk>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
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

On Tue, Sep 15, 2026 at 11:52=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Tue, Sep 15, 2026 at 08:18:38AM +0000, Bill Wendling wrote:
> >  fs/nfs/nfsroot.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
>
> This collides with:
> https://lore.kernel.org/all/27956255dde39f58d73a7b51cb53cbe3d7804f54.1786=
411026.git.mariianikitash@google.com/
>
> > +     ret =3D snprintf(dest + len, destlen - len, "%s%s",
> > +                    (len && dest[len - 1] !=3D ',') ? "," : "", src);
>
> I prefer Mariia's version because this inline ternary is difficult
> to read.
>
Agreed. I was trying to not stomp on her work. Please ignore this patch.

-bw

> I was expecting to land hers soon if the NFS folks don't pipe up. It is
> one of the rare cases of still being open-coded, but the strlen() usage
> was pre-existing to check for the trailing comma, so it's not a clean
> seq_buf() conversion candidate...
>
> --
> Kees Cook
