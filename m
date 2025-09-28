Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED688C0B
	for <loongarch@lists.linux.dev>; Sun, 28 Sep 2025 02:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759027715; cv=none; b=Q+PHsdhGlH+8Cfx231NTuggv2OxrAGDm9KAFI3u0M2Qus8yBcd/OPXE61a9+aMctZY65Y64zd4/IqCUTDjFjAO+wJPSzEIVx7kRDYcvEO2YNQH8qRoKsia8aneiPoNQ0GXsQR/nzfLyaIptSxrqFDqfL/CWNIwXs0qZsEMlefiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759027715; c=relaxed/simple;
	bh=G27Pgv7iGejxXksjp5F8tvsZrk3N83G7riJRNuh7fwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dA45zwf47aVKZHZC3WSUsETXwUteEjyu344fJe5HLDTLiuk0qQwhJewoX44S94/EZvCT+AaeERm0KzJM7+DJfmhGvs+BBeGeUMdHbzJk/CTXDDyI5bgtZPbcNQNe4plBm0d3FG0R3zE9+R95ehZ3gncAp9RTT1t9E5lxUMpfhdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2yMJ6Zn; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2yMJ6Zn"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-634c01ca9dcso2832178a12.3
        for <loongarch@lists.linux.dev>; Sat, 27 Sep 2025 19:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759027712; x=1759632512; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIqCPbhPlSD4ePjYmkMG9S4moNLTDdS5iBVcgknVqDE=;
        b=h2yMJ6ZnK3ovEQnkqdQcQ+AwXH/bY8Cv2q39LIpRd8LT+IO7wfQfNM7S6bU2U0kWJ2
         klxiLqTeMOInqmmdrXN3iiStCWZuolcQgWPkwXITjoVEtOVt47QKUXkAc3F9dovU9XN3
         h5iLQZ0w8rcN5dCsHK3HsGJTxN37QUUPAlRfIwjbbgSz2s4NQdJvTeQoXjVGTz8Py8tw
         Accg3cs64+gjfjot/l+J/XqXU320aasDGs5YJrWC+qpVZsS1OuN9QOQTYfzmWyUQxM2g
         vsdZKPylT5oKAp9MhcKBtHsLlGHYe+qgFYhv9jzwiuEJcJvrpnJmseyssNLHEGSjLvJ0
         KMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759027712; x=1759632512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SIqCPbhPlSD4ePjYmkMG9S4moNLTDdS5iBVcgknVqDE=;
        b=Zxroit+PUPJ+FlCTzqTrZxhN6FvZNf4IzdUbHGs3Kp7D6mgrmoizs0DmP1AhARqKNm
         VbAVIISROubH3nPxLJOie/cBqaMBjuBcptLyZDh4T21IxngOT2y60aIHOJOCnxdAlJzP
         RUDzbpwm/+EE4tA//kKdClkDPrufchjfhXNl+fOE4nK5Zkz2apuKJXvAFqP3dQ68JYYU
         Ct97/il4qjnktVSoXmLMwZG1khr+EhpaCnhy9ab4aUjZw652UYTYbBR7kJcTzfyXHJu6
         yWFDPWEuGqw5nIoaLdauBI2VZswvxetRw8hk76BdhoL9ihPBP72MH0YsdvlaxnbC+uQQ
         UWRg==
X-Forwarded-Encrypted: i=1; AJvYcCWqZWaoOdOeeP6H2AzgtEO6c5o4GFvr1G/0IDPOytixf1BWQ03flAVR0xnOudb0jmoiIuetYBoz4nQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ1oBRUbWzg6rhzTa2Z54nbkuOAdNBxxB5vIETZyiVR5qUOrRt
	d9bQckvrSNf5tr8p3vH9cGkkrItUdhsuG3kmIctTUFIUZm7ZT/utkLGz5deqht6eeXi4bIH7eAX
	hrnYo8SuHxFUcklmVltHoMsmGMo8SJVM=
X-Gm-Gg: ASbGnct7mc1olWGu+xGX6Pgqq1yxeXRB0PJ6QWVbM/qlM5Jd9NKC0C5+CcQv5HKk4t5
	SW7b2Ot4zYT7lXrnoA9GX0YR8kwNlmZKhemcz44W6/olVJGANwTGJL+GAKTrqzcmqNta/962KqY
	juXZcJR6G0q7iGXJPjckJXlwFxCWW6in0ht+Tkt4Bu1oectjL6rb9fmRkPCldLFyvAQSlMX+g34
	CUIgVVDqI7N8sCwNlM=
X-Google-Smtp-Source: AGHT+IHYFYzoo2FCZ+R42wdMNXg2gGCTC2KWOlpmGLAOuCsIbKMhKvzoC9v375rVavEqRbumDhQ8AHOLgwbwRq6XFWs=
X-Received: by 2002:a05:6402:5210:b0:634:a546:de45 with SMTP id
 4fb4d7f45d1cf-634a546e2c6mr9764402a12.23.1759027711786; Sat, 27 Sep 2025
 19:48:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1758676290.git.zhoubinbin@loongson.cn> <9823e7afe713450e210dab9dba6fa18683dc1fe0.1758676290.git.zhoubinbin@loongson.cn>
 <2025092428-glade-monologue-3663@gregkh>
In-Reply-To: <2025092428-glade-monologue-3663@gregkh>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sun, 28 Sep 2025 10:48:19 +0800
X-Gm-Features: AS18NWBz68QzCTskD3KAjHQSqckmCa7a4rjPHTjPL-thUzgT97MtzfY2E2ZY19g
Message-ID: <CAMpQs4JgR=iG6LAuYeVxOpE31S6n=dC4+FGUJczOYDVfWHDuFw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] serial: 8250: Add Loongson uart driver support
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Haowei Zheng <zhenghaowei@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg:

Thanks for your reply.

On Wed, Sep 24, 2025 at 6:22=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Sep 24, 2025 at 02:29:37PM +0800, Binbin Zhou wrote:
> > --- a/include/uapi/linux/serial_core.h
> > +++ b/include/uapi/linux/serial_core.h
> > @@ -31,6 +31,7 @@
> >  #define PORT_ALTR_16550_F128 28 /* Altera 16550 UART with 128 FIFOs */
> >  #define PORT_RT2880  29      /* Ralink RT2880 internal UART */
> >  #define PORT_16550A_FSL64 30 /* Freescale 16550 UART with 64 FIFOs */
> > +#define PORT_LOONGSON        31      /* Loongson 16550 UART */
>
> Why does userspace need to have this value exported?

Sorry, this was a cheap mistake.
It should follow the existing latest macro definition as follows:

diff --git a/include/uapi/linux/serial_core.h b/include/uapi/linux/serial_c=
ore.h
index 9c007a106330..5221d86d592a 100644
--- a/include/uapi/linux/serial_core.h
+++ b/include/uapi/linux/serial_core.h
@@ -231,6 +231,9 @@
 /* Sunplus UART */
 #define PORT_SUNPLUS   123

+/* Loongson UART */
+#define PORT_LOONGSON  124

I'll double-check and test it again in the next version.

>
> thanks,
>
> greg k-h

--
Thanks.
Binbin
