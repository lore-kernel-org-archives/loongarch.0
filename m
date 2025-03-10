Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3071581F9
	for <loongarch@lists.linux.dev>; Mon, 10 Mar 2025 21:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741643009; cv=none; b=KrHok7B8B2mqAbOmGGvGSnMlDardBuyO9YcROnz9pNqe990/Yu1dQBG+PVuSTgODl3nBPgFB8dOwrNLH9fbkekGygTRQHyBBZiXh2j5aqNq5/PGjXojrGPA2iuTb010WY3A0OFBqU2i61VNH961Sgen8Pk/sbSOhU2Mt6gfzLCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741643009; c=relaxed/simple;
	bh=MYOks50WoDkdoyOrPCyipUL7n4yzFqH0q8gA8fGLCyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXg0OyPyQXBXEMm8xIbfnQKQRCbbp5AeU2wsei5HgB5BHgjk0AcVYkQZG/hAwCwJXiXvUp6+f8mmU4vMV+1/rXFu96xc5mygldbbIfPljazb+zlNNYSgmYAcOM7Cdmf2TrtVd/UA4usPE/usX04TTWurPDyXTp+GcZ7sSl2noZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXKxXnSP; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXKxXnSP"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223959039f4so94539895ad.3
        for <loongarch@lists.linux.dev>; Mon, 10 Mar 2025 14:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741643007; x=1742247807; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lOzTUQX1PxOvtdBltrj7hxyrhemHlWPuwAmT+cGIKWA=;
        b=bXKxXnSPrFgkj6wnqE+fBNH1fap9UgZL/DBE+g5NH9g56FClfXyB7BKeQHi8xSBk1L
         S9vNsM2e6308gbxAU2d54LTAY7wNiGxFvWTz1B52H4vYHqMNtMNtvl0Z6HJr2vI2yUJf
         rUJKiS3q+uLs9677DoERdbNmHqXvoc7Ntt5KgLna7FDwg+3jadeVuoti00EOTDNkyNHR
         xlOkf2pHzXb3IYZZb+IKyfnURsYgnXXgrgUOWPt6vMZ0cHRQNVNt1WM59yRuPSVQ6FSP
         3q4vvWFVhoZnhj/toNvET8jp+Vlo4ogcSFueTe3X9ccCklBxdt9mEit/RiepUsqkVmOp
         htFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741643007; x=1742247807;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lOzTUQX1PxOvtdBltrj7hxyrhemHlWPuwAmT+cGIKWA=;
        b=EgO5nqYDhUWWL8nHiUJZnuEE/pOGZF4i3WPRE77i89xM1jbicuabiieScrIUGi3OIE
         XMbGCZ7mgAW5ME4Lhw+eeIcduukboSxNFBcTTJYhFLDEG6vr6P3KlyqAe/Oo0WRQJQmw
         i6bLn6FyfFi8c5unv9R1v4Pd+5m4nPCxtnt1kt7jm5xAlrWwZ6FHKHPRC+9m5wpXZosW
         lqSp0g1hn/6VxW1qvXcMqJSsJkCtxS4pO2FItYKnkqqPUSXvfBdk4igF6zyI55lXGTIM
         DSoFWQ66DEaK7anWlrqJtjTsHwWG3E5VQQ3HC0FXDs5mLfGy6AMmq3X1KYxm7RKTIq4y
         Ml1w==
X-Forwarded-Encrypted: i=1; AJvYcCWw/5hgnVUiRO3YDS87u1pHHcD7SMLN+dI+6hFDvtmFfGCzMz20YMixmUQFD0cQspgXQZFS1GI5640=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUfy2WiI9aO7vSPvMmVndLaqlAYtocXFA8wMxYYDE7DThLQQMb
	a1JXOoyXHDtsqpac1cpwTydE0/VzdJtSf1k3ji/s/OoKGsI2IGEG
X-Gm-Gg: ASbGncvrGgc+UP3CorCtTOKngD3aDvoBcYl9ts/sDqL3cez98LIyYycWcvS9mie4Qcw
	gYxvUVLn9XPMtsVDaJaXPwYU123v0Xav6yDTJ1PcucKjC8qJbYa+AgKsEENeXg6/pd/UeFXjDFf
	w/vot5KrkoQ7+5Naa8JBZLU3zXxq0lp2lr6jqL9OFjaJwZ1KfJFSbAnnFlFCYl665XiwCaeM8av
	8pXZVdv62JUYPxRd2LquTcbgpuwwpDo2nDoMWk1dhFSR4vIzPSqY+i8xc5Dg92desST8ujTPRcW
	F9LV29Wx0thEJdk9PvpGT4qKepLM44SKSwyMX4cdp11gTVUL
X-Google-Smtp-Source: AGHT+IFXLOvBDK4X9wfckI1WGUGqObmmijVRJTHS5odxNcOP7KVkt0gWd9EjluMvYqCdzJjttkoSSw==
X-Received: by 2002:a17:903:1b63:b0:220:d79f:60f1 with SMTP id d9443c01a7336-22428bd591fmr224360105ad.42.1741643005529;
        Mon, 10 Mar 2025 14:43:25 -0700 (PDT)
Received: from localhost ([129.210.115.104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736ad7e4448sm7037677b3a.111.2025.03.10.14.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 14:43:24 -0700 (PDT)
Date: Mon, 10 Mar 2025 14:43:23 -0700
From: Cong Wang <xiyou.wangcong@gmail.com>
To: Vincent Li <vincent.mc.li@gmail.com>
Cc: bpf <bpf@vger.kernel.org>, loongarch@lists.linux.dev
Subject: Re: [BUG?] loxilb tc BPF program cause Loongarch kernel hard lockup
Message-ID: <Z89c+5k3sRX8Al1I@pop-os.localdomain>
References: <CAK3+h2woEjG_N=-XzqEGaAeCmgu2eTCUc7p6bP4u8Q+DFHm-7g@mail.gmail.com>
 <Z8oXIhptXWhbCeCF@pop-os.localdomain>
 <CAK3+h2ys8ivcnnd=em7QZRWqqmtSuqy4xEiDoV6+9ccOzJHu4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK3+h2ys8ivcnnd=em7QZRWqqmtSuqy4xEiDoV6+9ccOzJHu4w@mail.gmail.com>

On Thu, Mar 06, 2025 at 08:04:14PM -0800, Vincent Li wrote:
> Sorry I had a type error on the loongarch mailing list address, corrected it.
> 
> On Thu, Mar 6, 2025 at 1:44 PM Cong Wang <xiyou.wangcong@gmail.com> wrote:
> >
> > On Wed, Mar 05, 2025 at 04:51:15PM -0800, Vincent Li wrote:
> > > Hi,
> > >
> > > I have an issue recorded here [0] with kernel call trace  when I start
> > > loxilb, the loxilb tc BPF program seems to be loaded and attached to
> > > the network interface, but immediately it causes a loongarch kernel
> > > hard lockup, no keyboard response. Sometimes the panic call trace
> > > shows up in the monitor screen after I disabled kernel panic reboot
> > > (echo 0 > /proc/sys/kernel/panic) and started loxilb.
> > >
> > > Background: I ported open source IPFire [1] to Loongarch CPU
> > > architecture and enabled kernel BPF features, added loxilb as LFS
> > > (Linux from scratch) addon software, loxilb 0.9.8.3 has libbpf 1.5.0
> > > which has loongarch support [2]. The same loxilb addon runs fine on
> > > x86 architecture. Any clue on this?
> > >
> > > [0]: https://github.com/vincentmli/BPFire/issues/76
> > > [1]: https://github.com/ipfire/ipfire-2.x
> > > [2]: https://github.com/loxilb-io/loxilb/issues/972
> > >
> >
> > Thanks for your report!
> >
> > I have extracted the kernel crash log from your photo with AI so that
> > people can easily interpret it.
> >
> 
> Nice to know AI could do that :)
> 
> > From a quick glance, it seems related to MIPS JIT. So it would be
> > helpful if you could locate the eBPF program which triggered this and
> > dump its JIT'ed BPF instructions.
> >
> 
> This is call trace from Loongarch CPU so related to Loongarch BPF JIT.
> the kernel seems to lockup immediately right after attaching to the
> network interface. to dump the JIT'ed BPF instructions, maybe just
> load the BPF program, but not attach it so I can dump the BPF
> instructions?

Yes!

You can load the eBPF program which triggered the crash manually without
attaching it, using commands similar to the following:

# Load the program without attaching it
sudo bpftool prog load hello.o /sys/fs/bpf/hello

# List programs to find its ID
sudo bpftool prog list

# Dump JIT instructions (replace 123 with your actual program ID)
sudo bpftool prog dump jited id 123


Thanks.
