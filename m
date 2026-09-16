Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F914DAFB8
	for <loongarch@lists.linux.dev>; Wed, 16 Sep 2026 21:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789595075; cv=pass; b=QPl2fK7EfmK5S/i40aX6jeYHDcnDCf/gOw0a52EzTqy9QHzrb8lMWw2xxERm/+y5i1qnGngQLqd6uWeXGa7tqLFGtGp92ml/21g9yOx8HT+8/jjsIjgxNooDeyKMKb7r7MMdXDAJI+47HWwS+s01V81s4IRyegkaO5NxVxGo4Jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789595075; c=relaxed/simple;
	bh=+TMWi8xF1c/GpLGSJWBDMGttEHh102/5Ofx0+5TAWdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EbbHeT+/J7J2nYnylXzJtFiEmr5dIs83SUndIvgZgcs1Vnsmwgv4/4tkGjMlkQT4UKwJyVsHyvi864wzEmbLOwBuX/diMmv5SQqUA43VMt6r07xegrPz+IHFIasxJF6WHqX72A2QWYQwt5mdxcGlIDGpcMLEnOqhksEBQCSUkZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iWpLMWup; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iWpLMWup"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e9af41731so61824241.3
        for <loongarch@lists.linux.dev>; Wed, 16 Sep 2026 14:44:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789595057; cv=none;
        d=google.com; s=arc-20260327;
        b=TTWUn82gGiHUQEcHgTk4XK//4QyUj+A9eGau9OR414ky3Z5mjMjND8xfIROaTCc2km
         5+blEPd3C01L40NXKgM86wK8gBiwuG5JMcDb/uxyu20hN+qK/TNbaWWuRZPI0dyNsb+i
         GHEzHnuw8mhErYgb8vIKhgrOlAnnEbCKJcm4swj+tlFttiy8eNa4NDGSIlEelF4eRWRr
         Rv3OgwKn3ErE7dv1Q3FOM0ZumLv1AKGrVAh9hwWn+9ZyeY4OaV1ZlwmTUfQrY+fdp7bZ
         0SQ6/S9RhPWwEvCcQ/sQY53H6ofuoQ44IY0DYnKG78dgq6uA7AtrlRb890Jfzlww8G9S
         QItA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+TMWi8xF1c/GpLGSJWBDMGttEHh102/5Ofx0+5TAWdU=;
        fh=FvKMVdzTRu98/poETHIzsFarX/Tyebp8a2rsifukNtE=;
        b=OdrZU0mNtyIfRahFnpNAL6LfiMfQS8FSG5y9+fkIe4DQ8VUHrh1L2mIu2nIRZUt+qv
         YhZptaGlNOX+p71EEC6c00QYNjEz0uIeIjhLd6ohRNUfoyTmriSBg495dDjVMITIeALk
         EOr2ZLWPDmThi6sKhK69HpFaF2OizwDCLbGmJFJBw5w6eR0puIGximo5dleoZX5mzo7I
         GiMreGQKTvLruzkIQ6O7kJmsTeyzztgTFC6C/22ImQmaVyKC76vS+N3A5uBqwIWcvVV3
         CjIXDFUfobak3pmCSvlBTPrd35i4KnYJiZaPIbuKDK1zWGW41mPt/VWVZGaoYe89sWTX
         Lopg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789595057; x=1790199857; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+TMWi8xF1c/GpLGSJWBDMGttEHh102/5Ofx0+5TAWdU=;
        b=iWpLMWupYJ/DHhX0qDMyIzfKZssJ0dLfJRXwHGOEHVNqJJIQrVcOTFu3LC1Sfxh9t7
         +bdU6XG6L2kpsvneGiQ9sSDXstNRr/7wz1MPT4wIPuBmz1Uc9Ct13ZutZSagRfc73OAa
         EexuSKA3bvCbyGfXESfZ2SfYpYgM2ZCmxYPZMYbsb2gBTbibDF/YBfoQXjFeZe03d4uo
         aUgiGV1divl1QZZl0BWBvuB+mUTQS6oNQCpmDIrx6rp1C7CjubsyH5kIUDYhetiyTEfM
         gn9gFIvjNzVVgHF4sgbJWWqsgWCPwxJJVgchtOAgyaiTnt5jNpzPOEM8VPpeDVKer+ID
         zOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789595057; x=1790199857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+TMWi8xF1c/GpLGSJWBDMGttEHh102/5Ofx0+5TAWdU=;
        b=Ui9glqbDfBpnNf/jsVW1g7r1hDIZHTOaYQVDYcvc0cbZXjEgYsLElGI9f2Ru4zzy5O
         SDK1tUifrMcVY3NfX9FrSHM2mp0t9ku+3At2WSH94aqSjo61DwJ6g6FmYxbIvBmV4qHa
         lkWEGoS7Q9P/9Rm/LVnN9fxZkrNquLxGSKtwwKF1szE2LKJik5wck5lnsOsTfOStO8qa
         EcqsJP62+wVc6HuXo9i5LYldR9k9YKgkpiNot1b1LjYFt1zctM1wKTujkL6SD/6qztA7
         d/LoMrS+eTZ7B2BZdfxPP5ueO+URddWrbOinmtncf3Aqaa8iut3lvabrxWG3Cw5Sn/Vk
         rAWA==
X-Forwarded-Encrypted: i=1; AKwUvBw2nWzyXCzOOCIk2LS85YIHeV0a+ZlgZzlwci9bUKgRIDnp0u5FrkR6gPWtIN181xxgw9QXLzcqzRY=@lists.linux.dev
X-Gm-Message-State: AFuF++lJS+1zR6i8mJi7G1N57BIVCmNGSMwcM1UvNRpA3+dwi91gs/vl
	5M2itPgpoFT+tQ7c55sO+h3ijyVYbSTWoZmN8Ke8M9h4kh9TKqpZkYUBCq609zwSZBuABC8hbfZ
	/3isj82p6aOwy/LAcr2iwoZr+SPlkD/ZtK26wJ6M=
X-Gm-Gg: AYBFou0PzuhanjJQ+IZAQTQ0+TjGh86oAINJ1vOhjGIhx4QHJTEvV/sVVgBt9xpT9as
	gIgbTKPVQlO72n39Nue9xXD3Q/bO7416oPg7PnD8TVtshbvzjP+KiIpwPSDoo6jELA7bbGJzsve
	7dNTq9ppNSVDzFqdaQnMK6DdkaMS21wcRuK70ImoJz0HjSlnhMmBElN+YwfUbDxLfkPRDpL/WAY
	4MVQXUpfTEvY7ZBNwn32uSXVkUl4xnr2aXssMmMJYAZOVCOn4VXAmIMen/uC0ZMIuvevGur7SPq
	0jkIgYvih/tuTUHVd69Di3Sj93XUTot0gaYIrY35w6SvTYU9CzpS7cc9JmOzbCkRWS4crwCTwgB
	kXzBmt3WbYFz4yEWvsvJ2
X-Received: by 2002:a05:6102:a85:b0:7a2:2a6b:e7b4 with SMTP id
 ada2fe7eead31-7a22a6be8efmr62586137.2.1789595055938; Wed, 16 Sep 2026
 14:44:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915081910.4142719-1-morbo@google.com> <20260915081910.4142719-26-morbo@google.com>
 <202609151258.5FC01072@keescook> <20260916010945.GEaqnsWSZ-DTMyTO25@fat_crate.local>
In-Reply-To: <20260916010945.GEaqnsWSZ-DTMyTO25@fat_crate.local>
From: Bill Wendling <morbo@google.com>
Date: Wed, 16 Sep 2026 14:43:59 -0700
X-Gm-Features: AcwNN1XbboPOY3deKY79Gty15vkSErYIT9HTgeQdVXaDzFhBvm8_kiOA449bIqU
Message-ID: <CAGG=3QVZRCJ94+DOfSsSDhsrXVYf-ec01NZBy299nYiCAYfXKg@mail.gmail.com>
Subject: Re: [PATCH 25/28] EDAC/thunderx: Replace strlcat() with seq_buf
To: Borislav Petkov <bp@alien8.de>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	codemender-patching+linux@google.com, Russell King <linux@armlinux.org.uk>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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

On Tue, Sep 15, 2026 at 6:11=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Tue, Sep 15, 2026 at 01:00:00PM -0700, Kees Cook wrote:
> > Seems like seq_buf would be better her? But yes, at the very least, thi=
s
> > needs to be scnprintf, not snprintf (or add the checks as you have
> > here).
> >
> > The rest of the seq_buf conversions look right.
>
> This driver has been an orphan for a while now (we just made it official)=
 so
> I'd prefer it if we don't do anything here.
>
I'll remove those changes from future emails.

> And yes, that mega CC list is just gross.
>
Apologies. :-(

-bw
