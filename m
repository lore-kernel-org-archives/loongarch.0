Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710591;
	b=fpVGeEFHrnCGrX6Jt69U8t+W4qvshGLzawKL/p0MN7hYGSA58OTUL+zj+ShIw0hLsddp
	 mba34Qq7cAsQfEMhmUYy/VUGQWygHnRhHZxJ+d8yjUQX/AxpmYOOBhg0zVmrQdBtCm8ur
	 wYZlvhpj77/DbcYmv1LqSXRKzII86BtgUAqP8BNpBOXDri3CkfDqD1/4GuFHbK9E3ydJH
	 Tbo/Dz+eX38zp70pXjKqwA+61aWWluVVrZFDYEoX3A883Q7C5auXN8ZixxMopb+jFYpNh
	 AEcuXOpDEdu0S425HGYRDz0rafO7+siDRKuIG0TQhnqonLa6+aX85ZYF9Bfi6qiHZaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710591;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=kttV+dQy4onPT5plMXiOldX6XS4BxMp3lEYrIHyILIY=;
	b=kxFMKNBIKt+/rd0xldE3oDrqV1aLbJ1y3TYUSgg8mNnhMqsVKWeYDD7nLRjPpGWwabr/
	 WKe+C0vDv1K/B1QV0e++W01Nz9hHCqFw+9s0WIs1fYOIfZiQZzt1iKFEZAPn6f/WbIuBJ
	 GWHGD3FAuM31rJZ/CwsHhj1EdE5t/8pvtOohM1ECnnqggKbUu+s1sMp8PUwLWU61PqhNx
	 ZXNwqwjp6wJg2+WWvwbVZLF1VL42LOCJs2xYlm8yaF+x8oJLqJoo1QApz57JOghvoRhys
	 Ty04STW8JXNp9uc0iiOBj3c+203eH2dBav9AolQ0BnSGq9V2HQZjkvMA+qFUdZ3iekg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iXoaFtfD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44EA606A31C
	for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 16:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iXoaFtfD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A861F000CA;
	Thu, 26 Nov 2026 16:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795710591;
	bh=kttV+dQy4onPT5plMXiOldX6XS4BxMp3lEYrIHyILIY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=iXoaFtfDxiZj9/q8faM4O2+CQmUUKNGLZhsrk+3qwLWb4/41swPu0m/iGJDQCDJfb
	 0ny9MSmaDSsqvJVgXDG3PGy+0yZdaxbTSSFydMXdJQckUb/qn3JtSLpmq5CJHeVG6B
	 AdbiunG0CHuYvoxuhNSc1VVkAM7N6O9jCIGIsNYZ2tk9ie0f+tYkLpD7ACoD5PEM3j
	 5Q6/NLesdo1IxgJq41MdWAht5A1dLd1Z2oZRKdIuc2j0sPD2SxQeQT1NLmdK3Eu2uv
	 MhAkHw/I8S6/vFiE/8juYVc03EdoahKwFlNdxomGJhzbf9faAoSAdmxJ9gnPYqM3Ru
	 ypx2h+LdS/ZoQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id AA246198004A;
	Thu, 26 Nov 2026 11:29:48 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 26 Nov 2026 11:29:48 -0500
X-ME-Sender: <xms:el4Iaz3j49cb8oaY06V6LV3POP5KVF1KKlSHPT20WrqezfV2ICxTNA>
    <xme:el4Ia85i--e9rBlYPnCFfjDNetznWWf6L4_R4YPK0bmCSb7sE3zeO9CLjhKCNHN7z
    xFpDqYXrLNJyea4wVsAtUKy-Dm_89L66YoYU5VJjZ-Vx7lMGTUKqIg1>
X-ME-Proxy-Cause: dmFkZTFYRfiJHAHdio2/ynsVSgL7w48BjtWv7NgXKodlPUurxHfnhSjPRi+x1+eZGM4y8y
    QiQ8YrM8GJl+3oMdhC+oPgFDfi5OCTzINzJV9Rwox+77kCRQzyz+T5DrodfVNrATGw1xaO
    EvJDCEJuMAWapYRW6F/jQxIAbB5A/o3xz7umQsv0WAc6F/VM0zJe1fMR5NGeo4AFbAipx7
    bMUNP49TAWS++WSTUSMd1PxpTqRliMLPKFA9R1bkBwrT7rSdSpHBv0KJrTJlv6MfY5UKq5
    e2yc6fCTxLtRh4t4do6d/aSMLqyC6lmI/cHkgip55dHsxZe+YkpBt4bf6wDZ2fMAcTujco
    RVUs3ENdZvcgna+W6g84d2FGWancn12NEuE1UBF6sELkPT+1q6yF+onP/uxv3d1+8i87Rf
    HVSXG6+zMs07qc2SYL471oV6Kp4B3y6htVldQ3WyG2IDWcYD4jcqPWuteLsgbK+0nvoDtN
    djH6mWVTK6ayXsKhNMPtDLAE4dY45QBtYnQYbQjiubz4mQeoR7vy2/5HY+swfLq0BXB08f
    VTwp4I4g9XkQ2fZhtEbZPUQnjqtlxzBgRoXdfH9nkr/EvmMVlwFhccbAG+GKtNbj6DcPFZ
    xsWTW7VD9GZDDGOzK07QnmOv+bwzIkv0dFsu324v6dDB2+EbKFzyMsh0TO+w
X-ME-Proxy: <xmx:fF4Ia4U3oGBv1XCJNoNPAzqDdt_eknbaw2VFBgjoYNBYOeCETfM0iQ>
    <xmx:fF4Ia3hA5SkMRvB-BNWfNZyOs_0vwTIms_G9ONtpx9kDKaQle2dWUg>
    <xmx:fF4Ia7a5MFvZ7-d-qmThcHQUv5DSgywG1mTnGw4pvpXkD3MqKaXOkA>
    <xmx:fF4Ia8qaLqGXk-68XhTfXCzaRz0q66-VmC4FRjZ2TiuvBAjSXO1-IA>
    <xmx:fF4IawNAZUmDVgwh4tCF4BTYVJy3AO7jEEV455Wkr5FPmdRvDCIR-8TN>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 9F9F1F80093; Thu, 26 Nov 2026 11:29:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Thu, 26 Nov 2026 17:29:26 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Dmitry Antipov" <dmantipov@yandex.ru>,
 "Ard Biesheuvel" <ardb+git@google.com>, linux-efi@vger.kernel.org
Cc: loongarch@lists.linux.dev, "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>
Message-Id: <68eaf97f-4ea7-4d3b-adef-e9b51f31715e@app.fastmail.com>
In-Reply-To: <f2591cc9-563d-46c0-a83b-de763ed74e07@yandex.ru>
References: <20261126155017.2401147-5-ardb+git@google.com>
 <20261126155017.2401147-8-ardb+git@google.com>
 <f2591cc9-563d-46c0-a83b-de763ed74e07@yandex.ru>
Subject: Re: [PATCH 3/3] efi/libstub: Provide library helpers only where needed
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Thu, 26 Nov 2026, at 17:22, Dmitry Antipov wrote:
> On 11/26/26 6:50 PM, Ard Biesheuvel wrote:
>
>> - the clz/ctz helper is needed on all RISC-V
>
> IIUC Zbb-capable cores has native clz/ctz, isn't it?
>

Yes but the UEFI spec does not mandate that extension.

The kernel proper uses alternatives patching for Zbb, and so
the native clz/ctz will be used at runtime, but we cannot rely
on it at boot.

In any case, this just builds the object in the libstub static
library, and so if the compiler never emits the library calls,
the code will not be linked in.



