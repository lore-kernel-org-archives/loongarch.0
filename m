Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12E21714CF
	for <loongarch@lists.linux.dev>; Thu,  6 Mar 2025 15:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741275571; cv=none; b=n9xmLpS35vQwHfjpdDsSpfYypIezNkEuHhiYWtT3rUNFwz+t/UTlmf2Q8tLc3card8IYabbkp9wAPbZk0qdqDtsOYRmKCMw3AFo43i3W/Ci+tCn0wkIfoDnvso7sl5KuOJe06zMi2E0NjTlwMqnZSftbn9jRjhDQQgdwmwGSbjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741275571; c=relaxed/simple;
	bh=IVFOBeJSIFreDWk/9G9/+lqHc8zaSpccZ1sTQOb9BEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cpy6yufcsAMRbzK+f0yqaVoHP6sXXMhkKjd/2yTulEDLPdt70wStfk/WiVJnDzT7+YndE2RqS3p5koAh1C/j32QD+/3nKN/pMzA5TQ27HxVczMJmvoPJNR73z3aUOfhBtwyleNpr1imCAG5HoLOsJGr+ci1AOELWBFk1bsPzZxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSfz1ul8; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSfz1ul8"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-474f8d2f21aso7570611cf.1
        for <loongarch@lists.linux.dev>; Thu, 06 Mar 2025 07:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741275568; x=1741880368; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxBg96VxZo8JA4bc9W4FxssfizRNjG3j7rFQFUOMT28=;
        b=YSfz1ul8O21wZSiX5qIloU901jjX5PlJT1cGwYMNg/oFV+RogmRWUDJq9Y1B6+omAC
         4qWTqWjN8PdZlEOA1P88t9w5Hxy5crLvckshxhvyY/3FIqd7YIqhMiSTIiGp+p6+LAjG
         YIKYb4R4eoF5WoT5G/Ie6TZpatdGxxRH+xW3auJCUeqxDBhDxNcE7az9+JVTrWFh8CSo
         36XiwoF114GdxwlKKaDZNvv5ZFeq98BAuv3j26GQaUO/6O9ZeLQkPUhDMIBEeTRzN7Lt
         uFC9nf6Li90UQa70FDdhJTWgkrKnsi/nE2R86VkWgKFyjI4jyqkiJDN4/LWdWiAkp3yZ
         Mfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741275568; x=1741880368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxBg96VxZo8JA4bc9W4FxssfizRNjG3j7rFQFUOMT28=;
        b=uLb5ZUUluGuZXqqyEBbJXt5nqSdXl04Qvu2o3aZXLo4kGTyokqKsTd1Co1975dDKO2
         zQXQUToPXnsWjIx/Jl9OAS0ACAaGnmFGWwkbjrWe5YpMetuHCok9MnxD+uu876PdEB0F
         iImZUHvZTQtncFUnm4lWLgc5zzPLb+jMLJXuHHac7UTowo4L9xZurlT5C1hBxcIRORsW
         PwYqbWH97TzX7kUpfUDa2gM2xYMMnqWH0DzPJ7ofK1s0hFc0JJHvUSmnvCWTIV0dksIr
         Hmjyni5OAyx93YPwxZG25OIq82YBs3XUzeI6b9F0lq3fawyoz1SvozqaGR2VEKNTFDkT
         sfWA==
X-Gm-Message-State: AOJu0YwhiujwBsROxbqd2iUzRL+p056kCsalZ2QnSch/BwXh4DlS9M3F
	Is9EsdrVNjV1AvjkPlWdlGGRPaiWfLbVWTVnoK7SOK7x5WEcxn+7CU6gnOiMTOx/k9ko5SWrq4V
	st/7xRbagHxyh3ZFVobtXyJR8p+yw9LOx
X-Gm-Gg: ASbGncvNCTdPeuQ9JMJ+Vijl2VNLRvBkpnjeYJbdVOtUhaBR58DoP0thAuMuatpctFJ
	VD3QCKb/Ls8xFNY1MVq4Az+rJ9Is4b25xGOzOkOYve+tAJio2zD7TT5kGPZwGfrSnEZPvoiVyUE
	mUyORKI39hMSNTwCCKsPchp4TD7A==
X-Google-Smtp-Source: AGHT+IFa6NA+dnwcMLNIW6SmS6/TupI+6mi+rHGf/12/Eun+VpucwrrRAWENgT/Z05lOLEIHfYFeN3k4l/YGqfo3EFI=
X-Received: by 2002:a05:622a:148a:b0:474:d052:43bc with SMTP id
 d75a77b69052e-4751a4d9361mr49380091cf.1.1741275568535; Thu, 06 Mar 2025
 07:39:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2w6WESdBN3UCr3WKHByD7D6Q_Ve1EDAjotVrnx6Or_c8g@mail.gmail.com>
 <CAEyhmHRCXHbd9NL2QvOvY4yhKg2W7T0+d+0U9-PH5JCt8RqG1g@mail.gmail.com>
In-Reply-To: <CAEyhmHRCXHbd9NL2QvOvY4yhKg2W7T0+d+0U9-PH5JCt8RqG1g@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Thu, 6 Mar 2025 07:39:16 -0800
X-Gm-Features: AQ5f1JrcGcqGPHSQ0IkKGcJogbRRgVdCP0P0CjEdkmxB4FVZYmKJHa6TR9DA_p0
Message-ID: <CAK3+h2zWGJ3BKO6bErk=-m0+gE49iQ_JJG5FQZxXoiGsGY_CXQ@mail.gmail.com>
Subject: Re: [BUG?] loxilb tc BPF program cause Loongarch kernel hard lockup
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 11:34=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com>=
 wrote:
>
> Hi Vincent,
>
> On Thu, Mar 6, 2025 at 8:53=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.co=
m> wrote:
> >
> > Hi,
> >
> > I have an issue recorded here [0] with kernel call trace  when I start
> > loxilb, the loxilb tc BPF program seems to be loaded and attached to
> > the network interface, but immediately it causes a loongarch kernel
> > hard lockup, no keyboard response. Sometimes the panic call trace
> > shows up in the monitor screen after I disabled kernel panic reboot
> > (echo 0 > /proc/sys/kernel/panic) and started loxilb.
> >
> > Background: I ported open source IPFire [1] to Loongarch CPU
> > architecture and enabled kernel BPF features, added loxilb as LFS
> > (Linux from scratch) addon software, loxilb 0.9.8.3 has libbpf 1.5.0
> > which has loongarch support [2]. The same loxilb addon runs fine on
> > x86 architecture. Any clue on this?
> >
> > [0]: https://github.com/vincentmli/BPFire/issues/76
> > [1]: https://github.com/ipfire/ipfire-2.x
> > [2]: https://github.com/loxilb-io/loxilb/issues/972
> >
> > Vincent
> >
>
> What's your kernel version ?
> Could you craft a minimal reproducible bpf prog or try with latest kernel=
 ?
>

I am not familiar with the details of the loxilb tc BPF program, It
can be tricky for me to come up with a minimal reproducible bpf prog.

I  has another smaller XDP program
https://github.com/vincentmli/xdp-tools/blob/loongjit/xdp-dnsrrl/xdp_dnsrrl=
.bpf.c
that could also lockup loongarch kernel and can be reproducilble on
Loongarch fedora community release,  but it may be a different issue.
The common thing between loxilb tc BPF program and this XDP program is
they both use bpf tail call, not sure if that is related.

I can upload the new loongfire flash image  which can be installed on
3A6000 if that is helpful.

> Cheers,
> --
> Hengqi
