Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103512F7AAA
	for <loongarch@lists.linux.dev>; Tue, 14 Oct 2025 10:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760438354; cv=none; b=fNCp3/lvGmBblmtAsIFsZ5iWlRBxj/YBWbSK2ljtJigIO9ZvKGoUsyJQOQrvUd8psnsyM42XDRnFxg/3I8rmr2yiOQw9HJeXI5zUDQUVEMT6Q6+baI+gbeM/bO5wICizLQpGsLT/6FUQfSwGugl1JM+NcRCsORryafqn6bJr0tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760438354; c=relaxed/simple;
	bh=F46LslSaUY8DgHN3n48eTxDvyLVCIVU6v6jJMKyIwqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W9+3ooO/WfwgluTBRmbnbWi7uBY+F5eMiPZ78XUpS3fw2aj0p64pxgSboHGLQHP5f8g5/US1M9MPHc7MwvegRbTJ/7HhVgctmkofPEGn8u53xtKmoFUoQmqF5s1OY/3IGBQi9xMN1iHMLN1eq96eTWzx8XzC0AVqjgMrhoOzzBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YX7dt1EA; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YX7dt1EA"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6360397e8c7so5373342d50.0
        for <loongarch@lists.linux.dev>; Tue, 14 Oct 2025 03:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760438352; x=1761043152; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pokQkIgmHHvIRgJkKC6alt0eQ0/5qfJ7yTlxa5V1+JE=;
        b=YX7dt1EAf6DkNd/rOCMPh5yzCJEijEqZzruuakuUKT9NDYCF6gBal3ZT2KJI5bwaGf
         Lj2qcWk3qMvJ8s7wVdQw/ncztX16oy0e4E8Jew61Je/VqvE3c1jqU48zjaS+0VI3N5p+
         hMRG8L5eQ9o2eSvg1EdNoBaXblt594y1YhaXSNatu91meyjhM8Ttx2XftErbtpcur7r/
         WCK3fkf1iq6q6b6fVIw8OdX4oy0fP5pv+GS3rwHmbjT4YMDMl+JLN30YYHiVDcB+fMLL
         EykozR3kKoYLyrap6Me4MpE+iev/HD49+/QpKj4C9WZBFPKNpPOl7t1Cp7gCIrSPhh5T
         4J+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760438352; x=1761043152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pokQkIgmHHvIRgJkKC6alt0eQ0/5qfJ7yTlxa5V1+JE=;
        b=TlY6oSy1tF3ur43/l7XlBOI77qzjBPY2CgTw/gEt2U/Uz7Vehfd48IQwQltGWfiE7V
         DBfZX9lVq0TsqSsP92wlvNspQ824OmCSnqDTzxxukfR2zIj8eJZXr6LrTy7l25bwM1uw
         v9X+0HmnBy3Wdq1UST2niI9T/epv5pRbbtZ3SjJbFdZ+2qLxpE9uOsdpnZu7pCctAdRw
         Ne37u9KfDOBwq+cuTqU/nJnMTjIMZSqgpPAOEG622D+31DR5v0hcU1m2hu9Y+J3fSt68
         hfXR724BHyO6VF4RbuzyyLmapwQBCBYKC6fmLKuqFxY6265Bvi+fNCFHByFKSIw4yM1R
         x8MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqxqnf9geJcL7nS/DZcOZr1uN5eFKC0L2kFkMSNQeBnqaJvhC9xb4mw1g/EQiwoyG9ohuDObZN1bw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPBoWECpaczwyZw+EbhSL5rBDZzSPUTdEe16GNqXohoa+vC6me
	Qc+NzvSplO8PnA+qyYbOgRz27oavrTFzvYzuolTGt+Z03tLyfmPjfX0o229VycSLhJC+m3xFtSc
	JxtDh95rBQ225ryAhbs1nh+uNm5EqfQEC6C0pFF90dQ==
X-Gm-Gg: ASbGnct1P+34ikGWOru68tiUN3PZUtnrey1o48Ch/Ed2MBNPyOVvoWJ1GWDIgsNktw6
	AIOkhv7+NBvkyEihW9iWL2ayyaOELuKVlhgyvt2kLlpPyvmi8nSdP62wCtUXnTxOIqlaI6dqe9L
	QnaQlMz1C8qXtVsEWmntTwci92x3+zlpfwJeBmfHHTAJjQIXbHv4Nali7v91MB2qRNhwveVrpHq
	1B1bgo5bxYti6JOiDQXTauaD7FHHojXuLZqVZGJ
X-Google-Smtp-Source: AGHT+IHX+689HJuQIzxGKvDquDFhGYNkr9Ghi5QtgsmKgFKWhP8E8odTxafNGNZGGvvjaBJpeC/l8egbUVvSv1BuNt0=
X-Received: by 2002:a53:acc9:0:20b0:63c:e930:e35 with SMTP id
 956f58d0204a3-63ce9301f39mr13020069d50.52.1760438352092; Tue, 14 Oct 2025
 03:39:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250811163749.47028-2-ziyao@disroot.org> <20250811163749.47028-3-ziyao@disroot.org>
 <CACRpkdYC6ueVGngC=KMqh9aW8DiMKWyxoa8dqb4N3sEEkpdsFg@mail.gmail.com> <aO20G22p7OwJq6C-@pie>
In-Reply-To: <aO20G22p7OwJq6C-@pie>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 12:38:59 +0200
X-Gm-Features: AS18NWCg4FakAHKpN6u-x7lmptkHtb5kz_X0Y5yrB5k3cupKvc4MDFUSFgWvd_k
Message-ID: <CACRpkda7AMiJEVioOVANpQ1oe1rh7ejKs6=erA=hYQWoyLauog@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-binding: pinctrl: Document Loongson 2K0300 pin controller
To: Yao Zi <ziyao@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yao,

On Tue, Oct 14, 2025 at 4:23=E2=80=AFAM Yao Zi <ziyao@disroot.org> wrote:

> To confirm my understanding, would you like to drop the outside node
> (which now refers to pincfg-node.yaml) and refer to both
> pinmux-node.yaml and pincfg-node.yaml in the single level of subnode?
> i.e.
>
>         pinctrl {
>                 uart0_defaults: uart0-pins {
>                         function =3D "uart0";
>                         drive-strength =3D <2>;
>                         pinmux =3D <...>;
>                 };
>         };

Yes this looks really good.

As you see it is also very easy for a human to read and understand
this device tree.

If you want you can take it a step further and use just "pins"
instead of "pinmux" and infer the function part of pinmux
from the function listed there such as "uart0" so you only encode
the information once. But it results in a bit of tables inside
your driver.

Thanks,
Linus Walleij
