Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44BA2882B4
	for <loongarch@lists.linux.dev>; Fri, 12 Sep 2025 06:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757657223; cv=none; b=jwtF+OxFn68p/yvSjPXMti7hw2GggxAHJyFdHLBF3CB145i2+QaSyYWe/zp4cuZNte1QrdyMKMu5bYN91z9yOasnBu/R1HDxPOKkDMipbKmIQl61Hygj/AtodrnqaQJlI0MLSBsLozDIudLDY+j6LZaMMsCXps8YVAHjxb0Et6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757657223; c=relaxed/simple;
	bh=xhNUv4r15tNXSlEeRfAfsJoZ1YS+9y9Hm87zeZ8pVCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fDbl2QIpD8RUvPABuVfj1TGzgqiabRDlVtmFSw39zt+UGdMmT/U2Qo4WszA3qkmPB4iKXFmVkNWxc3f3LX5XgtMLb4GIaS1CdWWrFnYs6RE7Iz+YMpccDMT6IeI54qhm2d5WVx6nKMWG9XuwPeagDBJaB1c4Jugy1X1ycnswKoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPug2EcT; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPug2EcT"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b0415e03e25so193583666b.0
        for <loongarch@lists.linux.dev>; Thu, 11 Sep 2025 23:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757657220; x=1758262020; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOVssAlVzuybD/LJbI3Y9xOJ1MXiBDYcVtpUt3l7gBI=;
        b=PPug2EcT2WEls96Jnqtrz8hJav5cTwcu7OXxIhZC/ht8Qwgw6Pz8Jd3b0X1cUj/1ub
         0IU8RzVb5lA0c7Si0us1fEVyfMTofePgGrYUTNFc9hji3DbqZ+NEcboEN19nnvVRIVWM
         KgQHDGzU18uDafuBGj1gNnlREv0hdU1n8fROmS/b/ur1+kG3DYqiXYFzecMa2NgWJD1U
         2EJqvQaF5+EP31Jj0eyu+6Dh8/MhI0RaHR+9rnIlbNil7FtPyawSTJYQxmSVaHU+pQE6
         Yosq79hpRUaUp67WFTZmZvr+BOlXfn7BvjA4yH1r9xgSw659coMKpvhfkR0EhAHFGJkp
         XqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757657220; x=1758262020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TOVssAlVzuybD/LJbI3Y9xOJ1MXiBDYcVtpUt3l7gBI=;
        b=BMteSoXtniZc1VsxBQqtskJFbuiU5GtyB8GuXTVDuRkXbpg5YXk3wdKmABT4herhO1
         RTSJvvEs8Zr25Z1jvzbfaTKu5AS0lIxZnD1J+6gd669M4isaFP8JUUBvV+lRcm4AP5Tg
         C0C0xrm/77JQzqATO+WxdCze5c6VXRi+jwuLOkQzhm6nr9WsAp+RoD12Eacz1XXgC7g8
         EqSsneqfByolcldB1NRystQ0rpmXur75Vhe+k6hafa9ZVe8YJGZ7tWvE3K9fMCQavMI9
         pBT58m+tAsDL3o8EobsKLMc5c8xFFxh5XaclO+qmhg5X0IOudbPAU9bjETxhlt7P0c1W
         buxw==
X-Forwarded-Encrypted: i=1; AJvYcCUAIEv7QfH2PL34ypJDC8Criyh4rlA+tQy5/Z3NuHx47w27SPvl4g3HytYajbNZw2QZkZjNQ9w+1Bk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzEY7gxed2pTOnj2VsSNOz79kiJTTA1bBTgNr6wb+NNq4QshlBg
	5J2cwAcQFdazIDk19BnYeVGM0+08mfSL18Vp6MM66BvwLTrXb6w9/iUfwA77uFzaB2ATuvHxsQZ
	+rfYRrZ5JMaUZdiSC/MKadmXdsVn1pL8=
X-Gm-Gg: ASbGncsGQeoQzTc+bOhUD3DW9XQxGaz4Jtjxtqw5msNhC0I61Epo+qecT56DnnTBdkT
	ca7NeF65/mxDIeoFrScAlasHWjJTdTgc6tqnIWrkcRgUHroXzPNF5MA/X1x6e+WKDbFIMUIiFMn
	S0RwHwxFw5mdLGrxrlfMfGYT08Jdlnk0tkyYnitUK4+oQxx/a1AAoI86ztS/9v6FsnImB+mmb9N
	sFycGD3fnqFV0+weQ==
X-Google-Smtp-Source: AGHT+IGbUmIoLVqRxKuVQ8ZiqtWYSSth8aq/nfPm70faiRBEOfXVPN4NALZRbJpq4jayZtv4bcHIGewkEuMmT769r/8=
X-Received: by 2002:a17:907:3f07:b0:b04:7ad5:b567 with SMTP id
 a640c23a62f3a-b07c35be704mr164366766b.16.1757657219928; Thu, 11 Sep 2025
 23:06:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1757318368.git.zhoubinbin@loongson.cn> <8575ff2d46b701950b1b0da3d3c181db331f79db.1757318368.git.zhoubinbin@loongson.cn>
 <20250910-knowing-labradoodle-of-protection-d37884@kuoka>
In-Reply-To: <20250910-knowing-labradoodle-of-protection-d37884@kuoka>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 12 Sep 2025 14:06:47 +0800
X-Gm-Features: AS18NWCgzeCmKpxIiPEQ4y-Le_Edm7fm5KZRjhTlMd28XiZokJFtKz-8hZ5wN2U
Message-ID: <CAMpQs4+9DwkELn3xyi+PqOGNabGC2vvYiujjTa0Q1wH6mSacRg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: serial: Add Loongson UART controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Haowei Zheng <zhenghaowei@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof:

Thanks for your reply.

On Wed, Sep 10, 2025 at 4:28=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Sep 09, 2025 at 08:11:18PM +0800, Binbin Zhou wrote:
> > Add Loongson UART controller binding with DT schema format using
> > json-schema.
>
> Why? Your DTS claims this is 8250 / ns16550a.
>
> This is just incomplete commit msg. You must explain the bigger picture
> here, not repeat what the patch does. We see what the patch does from
> the patch.

According to the chip manual[1], the Loongson UART controller's
registers and functions are compatible with the NS16550A.

Would adding Loongson UART compatible to the 8250.yaml file be a
better choice, as shown below:

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml
b/Documentation/devicetree/bindings/serial/8250.yaml
index e46bee8d25bf..abd41e996e68 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -99,6 +99,8 @@ properties:
               - nxp,lpc1850-uart
               - opencores,uart16550-rtlsvn105
               - ti,da830-uart
+              - loongson,ls2k0500-uart
+              - loongson,ls2k1500-uart
           - const: ns16550a
       - items:
           - enum:
@@ -143,6 +145,18 @@ properties:
               - nvidia,tegra194-uart
               - nvidia,tegra234-uart
           - const: nvidia,tegra20-uart
+      - items:
+          - enum:
+              - loongson,ls2k1000-uart
+          - const: loongson,ls2k0500-uart
+          - const: ns16550a
+      - items:
+          - enum:
+              - loongson,ls3a5000-uart
+              - loongson,ls3a6000-uart
+              - loongson,ls2k2000-uart
+          - const: loongson,ls2k1500-uart
+          - const: ns16550a

   reg:
     maxItems: 1

[1]: https://loongson.github.io/LoongArch-Documentation/Loongson-3A5000-use=
rmanual-EN.pdf
>
> Best regards,
> Krzysztof
>

--
Thanks.
Binbin
