Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7301F0E3E
	for <loongarch@lists.linux.dev>; Tue, 16 Sep 2025 15:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758035947; cv=none; b=TJVfLtLpuOyloHPbJSsoHNtbATz+QpcDyt8DTMFMsLAEGjpISInSxJ3tBOdc58q9YfYIdKpf6iwdWuRtxmJJd+gD6+aNqe3ih+tMvpCcXlz+uNVzxg2QWGFmzDX9XazZ2YIS/Apl7UNvmQew17M0f9T5sMbxvygRpvTmuRiZA7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758035947; c=relaxed/simple;
	bh=qobymtF6bCxe6oWp1HPqHiNgcrfh79AHQBPc9OQhHec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQHH2pVrK+HUqL6wrhL7hsUvtv1UUDC4lhwx1J/xQZoSl6h6Arp8H6qcY68oWyR8WtovEvtyCw59Wmp8STrNrBk1HgaEKOAFv+vTiv3MSU+YrVTIs/L+HYZhw7Wr3ItBXZpH2bubqgp/7xQbZSDAhLqB6hc8Lev3DdANHEec6u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=I9kaZhn4; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="I9kaZhn4"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6234995098eso1527202eaf.3
        for <loongarch@lists.linux.dev>; Tue, 16 Sep 2025 08:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1758035945; x=1758640745; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+p7h9moPYgINE98uoLpnHKJBq2tK9bPrrVW4csykGcc=;
        b=I9kaZhn4NrLDx2BKp/uCGEh4+ts5YBWIi1i2/C9q40xN4NRoY9JGUSRyrHxfo3PRp3
         e9rLnDXHEYLnIrnvUk/sVdOHV3QKhQog5TEeK9WXP8BG1nfMZ9d1fZTSOn1xCHIErjuX
         IvBjQICf7uWLi+/qXEIWsBFLZDaQTQanPPs6tCtKtnUlS58mXIISEymnMMnjIxL9Uj9F
         DorVqN8rENzUZINPMditZVujuGmrfbFjjMqQ3UDXxxIagZEHGVGZxIREwv0BJEqWJTR3
         Cb+lgSw//zJ7MVR4fG7RAMW6UUySRx42bMVR2y2KyA5DUPd+Oevb/5DNgl1glTRpAUVW
         E2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758035945; x=1758640745;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+p7h9moPYgINE98uoLpnHKJBq2tK9bPrrVW4csykGcc=;
        b=IQ/79x+EaosSS8j9wrcnD2uTVpgY5NFeAwqnYYMz2WWVT5ZHafktmH12axrvxg3r7H
         5VyzIHdAKpXWRbhusSFr6CjINXznxlYyWxQgpR/k+TJ1GJXgRvISyi/IFz2g21HVBulj
         +0+252wio7+oduk0V2Q7Q5IY2XlWcWHdr/MEb2Ig6HVqJp5pOe0dpaLy4JGeD2U8TS3j
         bVU6p7WKvx667JKLJJCbXloYz24auF5ZpYaQ0mTC8z1Xoiim+can7EHMy0Nw7MI+Q6tD
         Mt0/0HXI+5iU7YVHusSpTfxmjceBXjVKgn8JxrrhoJzL1lE3h7Wv35XRNjfEVWrswKcI
         isfw==
X-Forwarded-Encrypted: i=1; AJvYcCUEJXpdvzCNeac+BYAeyHy7cTCMNbqMrrMzYf1LgHV6XKLg2bzA5ULYksGkSjjKo1yoqfNTZbOppOs=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt6dE4ybi4+aMRxXaguhutG0HeTOreFacUaBsm187Lvv5sQXKe
	dK49MRI/tf7kPooCKeBpvrmMCQAh6N63b9spFRIbte2rOxFe/ZGsMW+wl1nRDwu0DOE=
X-Gm-Gg: ASbGnctrCSmOQbe/zbxdCSKPKDcj7NCcN1jgo2BuRoVE3IjTJvRnbhzEa+ngZwMMla8
	65zieY75zFldKZC4pA+DHgjGPAWtFTyyVUBe9ChEcepxOuwiZ75o58QbCx4PW1XjAGPZP68MWkH
	zFZKXsj054Uhco/J6ZDC7gCWDuPTbwxKuUuPpDIsaiuT6uCPnQDSnfD6uDkZBDX1FmpeRLgc1g2
	I8M+d11b7r81Ya3GoAb5Snb2l0rW+WpJHz9UiGKQUFVZBBs0oD8Fu6FqM4eQNJpAMoaZwN337ns
	WImuEuo5cQuAM51/An7ekO5NrDVDwg+KAO1vugCSB9ey49QF5RnJvNx2+HpOKiij3kkGgu7Ls3C
	sAxUsXDXIiT/LLk27ChedzX788w==
X-Google-Smtp-Source: AGHT+IHukfIJqt11Qr9G8lw5Wx2j5qPkL0FBu5yNTX+Je/XHr/6y5XC+n3E6kNJrAdkc8n6REHrCgA==
X-Received: by 2002:a05:6820:1c9a:b0:61e:7bc1:3b with SMTP id 006d021491bc7-621bedb7826mr7978820eaf.5.1758035944996;
        Tue, 16 Sep 2025 08:19:04 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:f61d:e1de:f591:d56f])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-62341c04af0sm997167eaf.22.2025.09.16.08.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:19:04 -0700 (PDT)
Date: Tue, 16 Sep 2025 10:18:59 -0500
From: Corey Minyard <corey@minyard.net>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Corey Minyard <minyard@acm.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net, jeffbai@aosc.io,
	kexybiscuit@aosc.io, wangyao@lemote.com
Subject: Re: (subset) [PATCH v11 0/3] LoongArch: Add Loongson-2K BMC support
Message-ID: <aMl_47OOOotywm0U@mail.minyard.net>
Reply-To: corey@minyard.net
References: <cover.1756987761.git.zhoubinbin@loongson.cn>
 <175760122164.1552180.16853979882678693472.b4-ty@kernel.org>
 <CAMpQs4JbQU3D-Bs2687BXSC=FKJBS6RMvWAKb6AJEtzit6hWqw@mail.gmail.com>
 <20250916084002.GF1637058@google.com>
 <CAMpQs4+J2zYgZaGYBSaf4UwzKZY-qMoD1oe2vmgJQXAfghqu=w@mail.gmail.com>
 <20250916101438.GA3585920@google.com>
 <CAMpQs4+kj0i1BpJ4Nk+Z=Ov-AMEWcqPmkbruNhD--TmycX4z-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpQs4+kj0i1BpJ4Nk+Z=Ov-AMEWcqPmkbruNhD--TmycX4z-Q@mail.gmail.com>

On Tue, Sep 16, 2025 at 06:51:25PM +0800, Binbin Zhou wrote:
> On Tue, Sep 16, 2025 at 6:14 PM Lee Jones <lee@kernel.org> wrote:
> >
> > On Tue, 16 Sep 2025, Binbin Zhou wrote:
> >
> > > Hi Lee:
> > >
> > > Thanks for your reply.
> > >
> > > On Tue, Sep 16, 2025 at 4:40 PM Lee Jones <lee@kernel.org> wrote:
> > > >
> > > > On Fri, 12 Sep 2025, Binbin Zhou wrote:
> > > >
> > > > > Hi Lee:
> > > > >
> > > > > On Thu, Sep 11, 2025 at 10:33 PM Lee Jones <lee@kernel.org> wrote:
> > > > > >
> > > > > > On Thu, 04 Sep 2025 20:35:04 +0800, Binbin Zhou wrote:
> > > > > > > This patchset introduces the Loongson-2K BMC.
> > > > > > >
> > > > > > > It is a PCIe device present on servers similar to the Loongson-3 CPUs.
> > > > > > > And it is a multifunctional device (MFD), such as display as a sub-function
> > > > > > > of it.
> > > > > > >
> > > > > > > For IPMI, according to the existing design, we use software simulation to
> > > > > > > implement the KCS interface registers: Stauts/Command/Data_Out/Data_In.
> > > > > > >
> > > > > > > [...]
> > > > > >
> > > > > > Applied, thanks!
> > > > > >
> > > > > > [1/3] mfd: ls2kbmc: Introduce Loongson-2K BMC core driver
> > > > > >       commit: 67c2639e1fc1a07b45d216af659c0dd92a370c68
> > > > > > [2/3] mfd: ls2kbmc: Add Loongson-2K BMC reset function support
> > > > > >       commit: 2364ccc827e44064e9763f2ae2d1dcc5f945fdf3
> > > > >
> > > > > Thanks for acknowledging my patchset.
> > > > >
> > > > > I can't confirm why you didn't apply the IPMI patch, but this appears
> > > > > to break the patchset's integrity, potentially causing missing Kconfig
> > > > > dependencies (IPMI_LS2K select MFD_LS2K_BMC_CORE).
> > > >
> > > > Pretty sure this doesn't break anything.
> > > >
> > > > What build errors do you see as a result?
> > > >
> > > > > Additionally, as Corey previously explained[1], this patch can be
> > > > > applied through your side.
> > > > >
> > > > > [1]: https://lore.kernel.org/all/aFVtNAY4u2gDiLDS@mail.minyard.net/
> > > >
> > > > We only apply cross-subsystem patch-sets to a single tree if there are
> > > > good reasons to do so.  In this instance, I can't see any reason why the
> > > > IPMI driver cannot go in via it's own repo.
> > >
> > > However, there still seems to be a text dependency issue. The IPMI
> > > patch modifies the MAINTAINERS, which depends on the first patch.
> > > If the entire series of patches cannot be merged together, does this
> > > mean the IPMI patch can only be merged after the MFD patch has been
> > > merged into the mainline?
> >
> > No, not at all.  So long as all patches come together during the
> > merge-window, there is no issue.
> 
> OK, I see, thanks.
> 
> Hi Corey:
> 
> What do you think about it?

I thought my ack would be sufficient, but I've pulled this into my tree.
I can't apply the MAINTAINERS portion of this, but that can go in
later; you can send me a patch for that after the next kernel release.

I'll make a note to Linus that this depends on the MFD changes.

-corey

> 
> >
> > --
> > Lee Jones [李琼斯]
> 
> -- 
> Thanks.
> Binbin
