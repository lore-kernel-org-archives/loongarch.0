Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4553D16ED
	for <loongarch@lists.linux.dev>; Thu,  4 Jun 2026 05:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780552391; cv=pass; b=OowmAmpByi9Zv2dUnzM/wrF0b8jmzaY1j83OcMqKpptsbqjqmQKlcoNhBhu0Q9a7ORtFKWx8Z6e+7IVdP+EQnNR5XLdH7YMJjYLfur/2SlQQ9XvvyqNI+28pvhBSbh1Z++/1iSt3tlJd8Ku/nHtwHFWNt0uKhHqKhTL8nCK4+a4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780552391; c=relaxed/simple;
	bh=TLSpcxtgDeJBIXPHc/zgfPpJqeFc/XjZXKIQU+6j4Wg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LyFg+VylTfiLy/cPNwUGhW0kfgLuDTmzJ4sXoEv6PhSMMKQeePScDwus/WKGwsUDPQw+uMIPVDtW/DgMdC6j4UV3x4hcqtpa9wRygKEjRpHCtGMJswrwiEGaI0yc8C9KsepHlRHLFScw+xBcslL1+XYjXKXoRmtIzC4iAWM9kzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRnDHlyj; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRnDHlyj"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68d2342c5e6so388165a12.3
        for <loongarch@lists.linux.dev>; Wed, 03 Jun 2026 22:53:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780552388; cv=none;
        d=google.com; s=arc-20240605;
        b=OJ9kf5huugGzJuJbCRBnP2zsF3LQIihgZW3E3LVLMAC3skjPldpdir8M7mV++aq8He
         Uyl2UDLwuONDP4j3Un+6gEguH3WtG/Gp9fXtDcTK0898yJIBuQBeELV2tyX/Ia/d4GQx
         RNI2c16NnfDigYJyqL2OVlbBONc6botFYt9c3jc+g5SilFCKHSmGGSoEOkgYtdjzZaRR
         TDW6JbqHeOcowzZ2kopXdeb/lWJLxgJE5j82XViV6fbVRPBkDiic98QNpacoPBgeBpMX
         hT4qwB/5IwyykVeLApeh3fdg5w1kSCQw7MptqdfyEJ9TFyw4UTdedCTn08oDQXAWfs3I
         4pLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ghFlsP350/NvZ7Hzmhk2+1q0DGzMho+/JxGVwW5E1Gg=;
        fh=7wVgRb1Ot130lvJuw59OiMoUhr+vOSktMPDITkO2Ewo=;
        b=SIn271/Z1zkF36wZ43BJMxJ+UoF0Q7yiix9485lIm59z1imONAhIt30Ja7JfKoMIzm
         4QIILS4WPQlrlWQw02CUbXYTm1Tnozcfzw0Hxj9rEqkf6oIO9emRWBnz+vN+oDaaSgYF
         oMzSpp4CWkVP1myDUtQ3ZzIjYkq7bUD2sJofyfoHJRPOaVwBFt5ntnDwH2QFB2b6CILF
         dD61PRfpofl16m8z8+vq/ybW4J8fHdBxp/HSybfsAwR/ozn2N5D4rG6vuV6MAcD/cyjM
         TnTfnRlhY6JE9JZyjt/SQaCBHv1DyKmCyyE9X6eNrCjekasYZZiiSjMQlLdrB8cJGJOh
         aZDQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780552388; x=1781157188; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghFlsP350/NvZ7Hzmhk2+1q0DGzMho+/JxGVwW5E1Gg=;
        b=GRnDHlyjM3A5qxaYIDW9LlA2De/Sbsd+Xb/et5scaOitUyaW6HDzy9S2Q3Z1PtzN+i
         7eTlZ+xkW0cCfwKXJ5+9CJhu7J3eHpHQ0h62hEzcrvXrpdHZz0W8ph6G/yAADAW9NHAE
         O/VQYyDFWa8HfWhnM97FrYR9u6Mr9BsgjtSYvxJAqKpb6dcTYn2uZq4MTkS/qybcjNe5
         7FJnpiYHJwX8QGseclmOyx3WGxokFYAUD0xkD5T2+NoZHA9cIaLa4+pWxUGEfHO3E/pf
         uW6XNKNUbqH2VHYO4MW3BhnQFg9iAEIWRkQZzYSFvoVGye9m2Pm2/AwhXKCSiJVApH2f
         dZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780552388; x=1781157188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ghFlsP350/NvZ7Hzmhk2+1q0DGzMho+/JxGVwW5E1Gg=;
        b=aEbY3Fas2hpmNPaVhwixFjSYs9381S9WR0AdhFFUzUakAiQEGm01JEJWHvbOIrU9KO
         6O9vtzJDOOiPkH5E7n9ES4pXHIh9D7C8lmsVyo9uxQaJmwxqUhP0pJFpbVlTci3gXhLp
         tm5pMgQXdoq+N25joI4Q7hIVlDyDxzbbJD9jU5X41D5ovLywqPsFH7LPPfbaguMUTy2M
         ZL98O1+3dKIBI2VTfJV3YyCt5hgSn5DeEL0uUFqnZCJWANa4mfl1lhawL66RAERsGg/V
         5uj6ucl9VcwYhNYmsd69zI8+UPyytiPbdjGZb6TGtkRhOfj1salZl2IBReqiH3NL0M12
         w4ew==
X-Forwarded-Encrypted: i=1; AFNElJ8Je3YvDjeVPKS9uJQ34VNPRXgGDahMJqhwgKl2wQHYCZTtah6TDVBCH45NjAwYBQ+Rsx8STqJUPRo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhG9JPbWwuW1CX9gDIFJuB/MsdsEgfy5lpL9+0K/02TCIITfNh
	IAhgQ4ZqeSLmctRgh6gymyWRire2kqHJr3vBKynFCenRpAvRmNia0RdyrW/nLIXpdUIo9XN11RC
	2+kmOr4Ard/95Z7LaxNktMwM47KYZ54Y=
X-Gm-Gg: Acq92OEPJ3qA+upz+veY4QVgQ0k1GXXKujsoxj10IX/pLBokF65wnQDp2gUHv7qGGlt
	HkZnA701vOUHV32xFuDv6NpI21GVySy8O2SLmxvVVLgP7pu4n1YSJipnQgs9TM1DJi0o85HWuwG
	gzdma744FF1DybFvkZ6zwAmh/oS4vDN8D1XFObdPgCxnKFCpMadMDU8jwzrzFrITJqGcbteE6tO
	o13Bd2E0yXxKjRHf+OQuLR6zlox93om386bZyjv6+jN2k+0hpIY1+rhBGMLAztG0k6Pn0i4VdDz
	NQblmouoFrCA5A5pBSJ5
X-Received: by 2002:a17:907:6e89:b0:beb:f71c:63a with SMTP id
 a640c23a62f3a-bf0ac304ccfmr362950766b.2.1780552387749; Wed, 03 Jun 2026
 22:53:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1777273055.git.zhoubinbin@loongson.cn> <d7b19f6c1e634ffe4454809e73fb03058e7a1a9d.1777273055.git.zhoubinbin@loongson.cn>
 <709ef711-4af1-413e-9662-08892b18fca5@kernel.org> <CAMpQs4K5Q_vC=wnGp3gf=F5RU8t61PLh4dLEmcLMMbM4mR+Wnw@mail.gmail.com>
 <6ea756bf-d776-4eff-b0ca-eeaa6737e035@kernel.org>
In-Reply-To: <6ea756bf-d776-4eff-b0ca-eeaa6737e035@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 4 Jun 2026 13:52:53 +0800
X-Gm-Features: AVHnY4KGRyyIWLI06LGNy87w7s_XYI73IEIXy_xKoOqPwgPelZOiqr8t8gAYaxU
Message-ID: <CAMpQs4KfLP9z6TVx+xGzuW7KEXMRAC0Y59hMBUmq57x6U33t7Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] can: Add Loongson CAN-FD controller support
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Bingxiong Li <libingxiong@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-can@vger.kernel.org, jeffbai@aosc.io, gongyifu@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vincent:

Sorry for the late reply.

On Tue, May 26, 2026 at 11:58=E2=80=AFPM Vincent Mailhol <mailhol@kernel.or=
g> wrote:
>
> On 21/05/2026 at 05:24, Binbin Zhou wrote:
> > Hi Vincent:
> >
> > On Thu, May 7, 2026 at 1:50=E2=80=AFAM Vincent Mailhol <mailhol@kernel.=
org> wrote:
>
> (...)
>
> >> Use the CAN TDC framework to get the SSP value (c.f. struct can_tdc,
> >> struct can_tdc_const and can_fd_tdc_is_enabled())
> >
> > Last question:
> >
> > In the general framework, the calculation condition for tdco is
> > (dbt->brp =3D=3D 1 || dbt->brp =3D=3D 2), which does not seem to corres=
pond to
> > the current condition (dbt->bitrate > 1000000).
>
> Where does the current condition comes from? Is it some empirical test?
>
> FYI, the
>
>   (dbt->brp =3D=3D 1 || dbt->brp =3D=3D 2)
>
> check comes from ISO 11898.
>
> > Although for CANFD, rates below 1 Mbit/s would negate the primary
> > advantages of FD, from a controller hardware design perspective, I
> > would still prefer to retain the condition (dbt->bitrate > 1000000).
> >
> > Do you have any other suggestions?
>
> Using TDC on low bitrates is indeed unstable and can lead to bus errors.
> But the condition which you suggest
>
>   (dbt->bitrate > 1000000)
>
> is indirectly linked with the brp values. That's why the brp check is
> sufficient (and more precise than the empirical 1 Mbit/s threshold value)=
.
>
> Are you able to trigger any bus errors when using TDC with a brp value
> of 1 or 2 and a bitrate below 1 Mbit/sec? If no, there is no reason to
> add this extra check and we can continue to rely on the framework test.

After offline discussions with our hardware engineers, we have decided
to retain the existing decision criteria.

The threshold is set to `1 Mbit/s` primarily based on the CAN 2.0
physical layer protocol, which supports a maximum rate of 1 Mbit/s;
this decision also takes into account that at low baud rates, the bit
duration is sufficiently long, so there is generally no need to enable
the second sampling point. Conversely, if the CAN controller=E2=80=99s time
quanta clock frequency is very high, causing the BRP to consistently
exceed 2 while traversing parameters, TDC may not be enabled.

Additionally, there is a low probability of bus errors occurring during tes=
ting.

So, in your opinion, should we keep it as is?
>
>
> Yours sincerely,
> Vincent Mailhol
>

--
Thanks.
Binbin
