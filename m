Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018E220B22
	for <loongarch@lists.linux.dev>; Mon, 10 Mar 2025 22:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741645917; cv=none; b=jcWVEbjbQ9OyScN19JUckkorO6FIgzN7+00kDx0/9UQFROAAFxlg1J7fQpNLAot7m1fpzK27cwl/dYdfKdcPhhLOadWE1PBpkIpJ0ey3+O/5EbEzamFbvxiENKOz3tJG8sPCeY5X/USPh2pd2QC0jZfsUt9G/byyVqJ+KXWhjZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741645917; c=relaxed/simple;
	bh=FViW56UXS+wiX8x/Td//iht1TACl5GFoovMzlLaeMhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B0MWqlCWUkLFeymT5HS054raUcZq8Ya2Bjx/LLnVtaecJXgTjTwzcpmTPmeWd1WkECZdNtIU39fkUzis1V1PQEOeQX5lB2Z2s1XX8yGplafupxKMcgpCFpgcLL5/sxjEeUwWsVpgWbLgDzRYqIs4jrbq6bR5RNXCGAG3m7YjM5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ET8afwGM; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ET8afwGM"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4769b16d4fbso1926381cf.2
        for <loongarch@lists.linux.dev>; Mon, 10 Mar 2025 15:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741645915; x=1742250715; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIg9XMQmzEvJno/MgkMxBzd1jni7htg+2SxEd9/4hrs=;
        b=ET8afwGMQi/k0NFik8r8fqMVHLKrBF8JzdkWHJIwDSgA7Co3th0PHJAIO8YLo6vD+2
         xloQRcgjiJnpDeKjm2mXt+0O61qecLuBGd5bEPcvA0RSDMvAI/gfe1tZOqMGEMczO/tl
         jKRqioc5548YkqrMiPJ9JSoEEgAvGC0MsvegULdcNgpPlhBjath9GF3rQcdz/9OMTePu
         fyK0gXFh0Z1ldKorUBYJHfrs7ARBI4k3inJBJjvYz9a2Xn7Zw8I2RwWWgUNTjovWGWy4
         BJA5S/oicgi3S8jziMiKeLY12JCjuW0kum5BG/yXH1pCPqGQeEWi4G5r1Szp6Sm4QZqT
         zOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741645915; x=1742250715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIg9XMQmzEvJno/MgkMxBzd1jni7htg+2SxEd9/4hrs=;
        b=vo5i5pPkb0WywLfBd/Ms3g4YPyDX/Fp5dl0m4eqnQgFuIGX3eWrRCusN68ezLksKNG
         l2SqDpY1LUG4rTUauP63H+CTdM+vMzCrtLhA5pm1cgN1siv3q8bn7DOj1r7uG6QGFVaF
         bVFCVwm5uRwEG1hMFR+PCFmQl4F9NPlMkK7EbLZiHRsPBq9eslzpCmG3F6K+A/peirhK
         nsH7wtmIj65bBIU8vDrwgNczSXjezy6mmIkMgYHu+tNqEPzcxS1S6mxpjaT+bp91Q4rT
         nDOqKd3oORfWTm89PNxvypX8Rob+TN2+EwO1Vtf8+r1GDnXOBAW146VV4gMhtgQi4JWZ
         26Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUcjUoTN1vE3rVBGznY+8RwZuBz8d1+c+VOLQ8/tBWgebtFrvG8J/I8vNmbqeQE/HRAzqOp+1rIyfI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwaQnpIWLsXtrwzZZQ7giLZ29gRrrvh8NvqoLQ9k218yq18bFml
	5byUZJ+pCJX9QPMQSmDpPrcCIukgOFMwke/+wIjMogGkYKozXUCpg+4r3cIKgdpDKWLSCF3lT9l
	X5yNKM2GlcOXsrjMG96U+hvIOW6E=
X-Gm-Gg: ASbGncszRTWde6mbnztrt5jKG2fwBMGDeq0c6AlLTO9u4ocy8r8BkBrdvfLQvV9NEs2
	q+A4wrwWSk18tz362b1FL3rcX2XcR07l1RIm/JiNctnEuTeSpYa97wSrkZvOIcbAvxz+kIzXjwj
	vBVjgE3oDCrsmMqu/5wR3iBt48d+Zlf/e5ORTeCOOakKTp/WnEd7H9WlFJwiw=
X-Google-Smtp-Source: AGHT+IFAVB9oy0OIFjeT9qgsp6CC85ZuOnHurnQxP1FeCilKwO46cHbQ0Bpabv7i96uhr/XXGAHafas8A4XALHy0b34=
X-Received: by 2002:ac8:7f56:0:b0:474:fa6e:ff4a with SMTP id
 d75a77b69052e-47618aeffefmr235409741cf.44.1741645914471; Mon, 10 Mar 2025
 15:31:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2woEjG_N=-XzqEGaAeCmgu2eTCUc7p6bP4u8Q+DFHm-7g@mail.gmail.com>
 <Z8oXIhptXWhbCeCF@pop-os.localdomain> <CAK3+h2ys8ivcnnd=em7QZRWqqmtSuqy4xEiDoV6+9ccOzJHu4w@mail.gmail.com>
 <Z89c+5k3sRX8Al1I@pop-os.localdomain>
In-Reply-To: <Z89c+5k3sRX8Al1I@pop-os.localdomain>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Mon, 10 Mar 2025 15:31:43 -0700
X-Gm-Features: AQ5f1JqQT2z2xC7GiMqgHWdwkj8qNYWL5UzhnRpR3ZvyTHRZAdOvsb_gEHYCpP4
Message-ID: <CAK3+h2zi+xKb3mqZeUm2jjiBzgq86F8jMDz4g3GRyQDk+U5p=Q@mail.gmail.com>
Subject: Re: [BUG?] loxilb tc BPF program cause Loongarch kernel hard lockup
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: bpf <bpf@vger.kernel.org>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 2:43=E2=80=AFPM Cong Wang <xiyou.wangcong@gmail.com=
> wrote:
>
> On Thu, Mar 06, 2025 at 08:04:14PM -0800, Vincent Li wrote:
> > Sorry I had a type error on the loongarch mailing list address, correct=
ed it.
> >
> > On Thu, Mar 6, 2025 at 1:44=E2=80=AFPM Cong Wang <xiyou.wangcong@gmail.=
com> wrote:
> > >
> > > On Wed, Mar 05, 2025 at 04:51:15PM -0800, Vincent Li wrote:
> > > > Hi,
> > > >
> > > > I have an issue recorded here [0] with kernel call trace  when I st=
art
> > > > loxilb, the loxilb tc BPF program seems to be loaded and attached t=
o
> > > > the network interface, but immediately it causes a loongarch kernel
> > > > hard lockup, no keyboard response. Sometimes the panic call trace
> > > > shows up in the monitor screen after I disabled kernel panic reboot
> > > > (echo 0 > /proc/sys/kernel/panic) and started loxilb.
> > > >
> > > > Background: I ported open source IPFire [1] to Loongarch CPU
> > > > architecture and enabled kernel BPF features, added loxilb as LFS
> > > > (Linux from scratch) addon software, loxilb 0.9.8.3 has libbpf 1.5.=
0
> > > > which has loongarch support [2]. The same loxilb addon runs fine on
> > > > x86 architecture. Any clue on this?
> > > >
> > > > [0]: https://github.com/vincentmli/BPFire/issues/76
> > > > [1]: https://github.com/ipfire/ipfire-2.x
> > > > [2]: https://github.com/loxilb-io/loxilb/issues/972
> > > >
> > >
> > > Thanks for your report!
> > >
> > > I have extracted the kernel crash log from your photo with AI so that
> > > people can easily interpret it.
> > >
> >
> > Nice to know AI could do that :)
> >
> > > From a quick glance, it seems related to MIPS JIT. So it would be
> > > helpful if you could locate the eBPF program which triggered this and
> > > dump its JIT'ed BPF instructions.
> > >
> >
> > This is call trace from Loongarch CPU so related to Loongarch BPF JIT.
> > the kernel seems to lockup immediately right after attaching to the
> > network interface. to dump the JIT'ed BPF instructions, maybe just
> > load the BPF program, but not attach it so I can dump the BPF
> > instructions?
>
> Yes!
>
> You can load the eBPF program which triggered the crash manually without
> attaching it, using commands similar to the following:
>
> # Load the program without attaching it
> sudo bpftool prog load hello.o /sys/fs/bpf/hello
>
> # List programs to find its ID
> sudo bpftool prog list
>
> # Dump JIT instructions (replace 123 with your actual program ID)
> sudo bpftool prog dump jited id 123
>
>
> Thanks.

I got it, with the help of LoxiLB maintainer, I am able to only load
the tc BPF program without attaching to the interface when starting
the loxilb process, the kernel call trace shows bpf program
tc_packet_func, I assume that is the program to cause the lockup, here
is the jited tc_packet_func link [0] which has 13064 lines, not sure
it is going to be helpful

[0] https://github.com/user-attachments/files/19171378/tc_packet_func-jited=
.txt
