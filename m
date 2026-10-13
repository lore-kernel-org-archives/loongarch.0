Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8430548987F
	for <loongarch@lists.linux.dev>; Tue, 13 Oct 2026 10:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888201; cv=pass; b=cBV0i4YuPqk7UE8M8LqmqL8r2UsGMD0L1woYsqlAPZLqMVcvsvRSvISuHz+C8EDTDQbtt2o/H86MV7/lK3CoFP275aDac9Bx55T9WjdkJ1cXuLCDK0pCVqReg/MGXgrS9990r7IEzpOyoJZJGz1qMXJmUiQe5P0yPFLTxWAeuYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888201; c=relaxed/simple;
	bh=//uOm0VTNuD0y0XaUO/FoU81M1a/Vo/45SryuH3ga2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+cFD/HPMIKNeR4Cqk7ZeigsnkgHTnPI4sqkujJi6+4598YVQ2bCQ5rxeUAi1KVmAJgIkeTGm2JQFWesk9jANrystgki34oGDIr0CGXrWrwxFOmEivpkRrv9wyq3+jAwNuq1+iKqJNfdGz4cLObqyuaWddhZyQjtPi8LxfSfWKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rjTdejrn; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rjTdejrn"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so4126762a12.2
        for <loongarch@lists.linux.dev>; Tue, 13 Oct 2026 03:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791888198; cv=none;
        d=google.com; s=arc-20260327;
        b=iI3jVOhuM2EkWK1EZxj8AKHbAWrvSl0f/eH2VKx67h5ATp0Ca1I56/08T6oQljuXrk
         ATiF1MqoAb6nhE0eTasw+sfRrcyikQElLeZpMNeBPkpmHc705njpP6FBIjzaP96MIx+3
         xuLMK0xeF/yuXCQW1GzsD+Z+7NpRe3MjIrhz4HirRSVQkLwIRbEuFwqM1EoQ1ntoCSZ+
         AbrRZSdSR9Cv26R38Ck5XtYikQOcVGBsFvHHovq8nsMqP00dh4sxsN2VdIu3Th8ZQTxm
         4F8TmVwX7ANiogcUVBR7DWRHHl9ejVGN/4VMtuPAuf6pTFwa/vhTHzNRFm+QyCugJEmz
         RRSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=//uOm0VTNuD0y0XaUO/FoU81M1a/Vo/45SryuH3ga2c=;
        fh=iqAqs1j3F1uVj8/0GeCGZaegG6xuIuNKryvAu4SeEho=;
        b=kGfpljL8wEGKoWNAJuQYBLT4ecy7xiOgLX9+mf/A41ceeX8OvDKRoYCxlKE2lDKpY0
         E8VteeX9cZX6Q+2sRXnD20Ex3Zftk7ISFldNT4xGS3I4cNbhYF8BJNUC99Kq/zD8wfzS
         tJQZnSzvCeENxs91hSD9sP1kqcN6sSqZNO3tDxcjjWzLEKxQbtHHFh9xmWnpgaQyUpXd
         QM2NgzIJFEgMzj3mIyg83Qjg/5MRcHJUhIGkz5slY6zpktXg2AftX6T/2NveeyyCiPHt
         9K4Ih9kODCOIaZArr59Ep83aZcMblDGEZbSYO6a4iroSiQGSF+jH+0nAZ7peIuaUzKJ8
         CAcA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791888198; x=1792492998; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=//uOm0VTNuD0y0XaUO/FoU81M1a/Vo/45SryuH3ga2c=;
        b=rjTdejrn5XIDQYKfzTyeOs5JoprtNpsm0pcFPVhaCi54OPPw178z/KuwXYecI01O/F
         0hiiPLIb+1XrmxAqct2uc39TYFQnLyrm3riLbZkBGve0TZrEH8rsiwAlmcD/puvh6R1q
         HojyFmrla9+gJcGutbX4/C239MQbgw8xSIBmbMhQOSrrjtjHbvgYCU8L4D0/jVyC99HD
         XKmUxbpbq0ntMtYWfiX+IOJQk3arb+t6iwXmbFBbzRr/er04LhenCbIegwP+3GhqO4AX
         CqRXh5wBO/XxndrcpGKTOPKrCHfIzp1SjbTEqUQIfLu2dGAcLqLG9s76bBCMB7Io5rml
         gxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888198; x=1792492998;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=//uOm0VTNuD0y0XaUO/FoU81M1a/Vo/45SryuH3ga2c=;
        b=wBTIjo9Wz22DMe0y926wyrNj/dDXNAVzXS8ynvTj5zxnvc3gFD0YuBqNXxD3vf9PR9
         UKrvP2xYe2BfqGGctQx8u6GHTillGCzH0akHXdh6ps1l8DbKoLPCwFJtfkliCvKpPX6j
         +Oa9P5oyoX6rhHpYcKr+luQCbEizGuudvw43t92Rx77s2EtmOURLUT940hOyAVSxp6Ly
         PC9+lNw7B9o9ciCb7HG2Ae32GzEjwloUtscYyL/Wbb+CYI+zJ1nAqVtDCzooJM386+JI
         nAKD056VU46xyO3WNDhOm+Q8Os1xTprilKp8HRBvzAVqpZ2+ll4o7F0EebJTysz0H5Kv
         tr8w==
X-Forwarded-Encrypted: i=1; AKwUvByZoa/+Q+wUNKgx/9jFJXFVRAlUKGVgoL0+FY0gppAX82m3fiDYAeeWVMdeoNA3+2FIgsgT8nFIC4E=@lists.linux.dev
X-Gm-Message-State: AFq9FYLQtNX0uljw65nI9xTApYca0sycdT5jkyxChFpFiR2jEK1NTWKJ
	MbfoLZx5UYCCAjqbT5Z8bSmNRx5gClArR+TwBw4MNXFIM8cS8JZ6szvYI4N8mFcsGtWKyD3v1M3
	4DaZ76Ln0PfiVVgPHUqI7sPzptkKrrPc=
X-Gm-Gg: AYBFou0ti+2pMHBM/MiyNWxIpKPEf6C2qZSzWb8T53HYuiROvpEJ0VtmpV2c2dH03/c
	/M2U9s4fdxkV1Foovqrqq62B7Jy2OX5zXIz5vwpkoNgcULMyNksOye2IvXHL//bQH3hJss43jt9
	z6jBCGsbXR9wUesS9jdvWOFLlzkAbLPT82jXf8E03HRYJxfPt35UY99HQnOGJDUK0Af3scYYjXI
	NerdiD0576qnw0onyQUduCfmXuLmL9Zhe+gBkJpB72iy0K7xqPyzuUMMUMUFTN3guO/Jw/GgPq1
	LRWivV5EViB1nu4QB3c7xosc4m+vAQVPtVPz8e99bBseqcL/bnGdxOY=
X-Received: by 2002:a17:907:968b:b0:c2a:c76c:c743 with SMTP id
 a640c23a62f3a-c31aa0b353amr1124595566b.35.1791888197437; Tue, 13 Oct 2026
 03:43:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1791512067.git.zhoubinbin@loongson.cn> <1375bd12403bffc496261953772a45833f9b5a3e.1791512067.git.zhoubinbin@loongson.cn>
 <196b51ef-835e-477f-a46e-575e37bb17e0@oss.qualcomm.com>
In-Reply-To: <196b51ef-835e-477f-a46e-575e37bb17e0@oss.qualcomm.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 13 Oct 2026 18:43:04 +0800
X-Gm-Features: AclHuK_tDCwBdwZoMKnhN-N9F4FyVAhXECtz50Zuv-v7rjKroUjNNoj2cpVB1Do
Message-ID: <CAMpQs4J5yWNsYY7NmWyWDSRuBjD=2HRwjLB0Rh2GnEaXxG1_sg@mail.gmail.com>
Subject: Re: [PATCH v7 5/8] thermal/drivers/loongson2: Use bitfields and
 per-SoC thermal ops
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, zhanghongchen <zhanghongchen@loongson.cn>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 4:50=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
>
> On 10/9/26 04:58, Binbin Zhou wrote:
> > Replace open-coded masks and shifts with GENMASK()/FIELD_* helpers, and
> > define named constants for the Loongson-2K2000 temperature conversion
> > and trip gate calculations.
> >
> > Split the temperature read and thermal zone ops into Loongson-2K1000 an=
d
> > Loongson-2K2000 variants, and keep the chip-specific trip register
> > callback in the chip data. This prepares the driver for further SoC
> > support.
> >
> > No functional change intended.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
>
> Please use the bitfield directly in the previous patch

Let me reorganize the patch set by splitting this patch into two
parts: the bitfields section will be merged into patch-3, and the
remaining changes will be merged into patch-6 as preparation for
introducing the new SoC.

This seems like a more reasonable approach.
>
>

--
Thanks.
Binbin
