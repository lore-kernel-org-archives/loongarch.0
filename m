Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795673206;
	b=BUCUnb0+ek682u6iJ3Zx+hMI+CLVuoYzQgsgcsKRZZVPRn0/va++ulKfAXEiSDIeIa9c
	 B7r0Ok9ELq8VWGRt1F73g1mUKvU8x3hiQ+FIJdT6SpP0McgSo+WgU0coMnKQInV4FTFHV
	 G5qObhOja37uJ/n5+6KqoQoThZRV6RKILqBTZLuSipTOIusKdE/tXicixOAjeS60E8oKS
	 GziQWh0x3lr3lGCMwNKWiwU/VX+AbHdfmW9J1oshQMEysGnBqO60YaBa17dkX9wE81Idi
	 CcUHzz4sl6Czx0qv/J2pBVt09qv4mdh+wovUmMILlsR+Vm/aIVAAkdx6IKBcqrtLP0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795673206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=rgZI8bJgZuUFpcROH1WhHUr+AAZ6H3onNQ6CGieUEr4=;
	b=GOWkOynKBuYHvrPa/FceIGVTWhXjOM9GBD8IkmO/hQ6TCXOkjpejS4dRR3gSnirg/blj
	 SUmiX20MbjXNFQS9V7TzhnPKogJf9DgzkYY8ImxFuvU5GbFLoM+blORt4yShb0U23GAka
	 abzihEFLuqGqT93vJSc8GJosJow/sSqSrjdRR/lTPU5ZyJfsktPLMb1T1OIbPiuDDiHIY
	 p5IoIlmQq+a+aMvlkWtbf56l4HZ/KzwawnC99oBGvi71f3tZ4M6jJ5iyIj3CP35RjaVeZ
	 wN3pJ6z/JH6xg6ZknLWJScozwmy5BsB7VnmsYDdHTgh93faVFRO7nfKPBtPFsXrrs6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOvDZxXQ;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B76606A321
	for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 06:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0B76606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOvDZxXQ
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f048476ab9so47137375ad.0
        for <loongarch@lists.linux.dev>; Wed, 25 Nov 2026 22:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795673205; x=1796278005; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rgZI8bJgZuUFpcROH1WhHUr+AAZ6H3onNQ6CGieUEr4=;
        b=iOvDZxXQWGnzA2eLsqBqvBIOjI0dad7/mgN0uruzdCaW+DrAU9wy7bIkBrfy7xd/YZ
         BObEsGKeNnkZcgNHCuFeSaIIFycQ6UAs7ho5s3PosuyFJ2Sr4tHOnrftCmegOXPhsNRy
         eeQWlxaxf3F3Mcl3sMcaCp9wjimXrAiuLjF3aNNZOfeuNDgnn4nZQVXWbTmnc7nhHV1g
         w5tOGFwviVbLNoMvaek17yYoMjwlwizIebPZXQNGBfqTX21zWywsZwpJmzAIvHlKnhZ5
         JnrAKxX82/EgTsr2nT7enE4a7QATBwKB7hbfA87F1YsIbPnhOcLCljab6Y2U2+A4MdIp
         sOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795673205; x=1796278005;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgZI8bJgZuUFpcROH1WhHUr+AAZ6H3onNQ6CGieUEr4=;
        b=RUGEDTejA0Ebw96ApiulFT8nA8rMlyASPJNJQaNtq2BpxHgGWiruiJBDD8gnn6rPJf
         B/CyStomRYtq65BSr8vesejrl9XspJ0GH0dg4Z7YG2cZnpPs1z+OJiet4uYvMXzs75He
         t+9Lt14du9FtD/wY7ApI3Xvp/g6HKfSwRAICNyPKqkkrHPs6D0Fxndq63+pTaPFU/4oB
         GghPikuAof3hA4pAkYm0VZ7NnJR0iJ4C6ILCLZGxF+rTIW3WX4FDr6SVmBEPCUiufAR8
         3bl3VLQYjFye2xC+Bw57ZxIMu7PD0Lo3YQtRh3Z1gP7IMshJyZCDFz9oE1XihjRcd4Tx
         0XhQ==
X-Forwarded-Encrypted: i=1; AL+hErFo1ZKliunnCF8z3la8rBQ8c421vkFbc9EF3eQd/9or0Gm3nDofEVwk/WS1V/rDWwOXdOgF2eZrM5g=@lists.linux.dev
X-Gm-Message-State: APuU4Z9ewjO3KdYg44G8Zebvv0th1NSgGhTZpTGJlA04538OxhJxhCHf
	HPE1MJAgEEbmAhyuQpmJF6X22P9cdWF0r+UaCdRsasmvmrUb8E9sZ3ml
X-Gm-Gg: AZFdTZcSJB00kHscK0fVWW2sBiJAxaBKWDAUuuM8LMOfOSKPIV3OfU9QlSfbJF0UOfS
	UH6LlsGk9RLbspYB7sdeZEtwENH1+N5BGe05LjeswN0vkeVo0Vvd+QnTtJQXQVyVbVo+i010NgQ
	pju+sCoTZU3TimOmyhcpq9Ye5vTsPtTIbYrn7deWcnGHqm4EE3nPEoC8yOyqkrQiiTL3OtTp4ig
	Ldi/jFOdzSnOJFPr/M7JujxIBe3QLyeOnalRdzk15sHtIu5qqUIpqgaVCkjYlBtLAFHLn+Jc91o
	UcdtPTl1JY0EWEAdwi/XDqanJtbURWWH1f1kanJkV6JVGbyrbvpNsxVaxd3OHT+6ZdG9sHb6LLp
	HEzGtUltW000yg4l+XZFmM9LMbOxBlGsa0P+hzzPrEuWNhMGvBqRxfDGnohZsnGbs7+CVjfdnDd
	epqfsvoMed5/Z7jkBMXCiCF5XUu0ESMhIG2HQNutk8AG8HvcJ7c2djDdK/vyS8X20Kr06ZvTxbu
	32Jvx9i3o93pPF3+4K6IDWdekkUkGFvOV2N2AWSxdNF44cDIdlA5WAOImDUgIVkM3QIPBu66tko
	Sr4hySOVJ43AR8mLKUOm5QlLBCJPwlZOhEkN1PsD9vlqn0Eipysvtm+xlW7rHe4eOY7MKkrk/UN
	CtA6KLFGXj8/Uf/joIMnjs9qITloBw7mnEVG+
X-Received: by 2002:a17:902:da48:b0:2ef:d1ac:c97b with SMTP id d9443c01a7336-2f03f19372dmr200960655ad.61.1795673204870;
        Wed, 25 Nov 2026 22:06:44 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm44555485ad.45.2026.11.25.22.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 22:06:44 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 06:06:44 +0000
Message-Id: <DN4X0XRWTM33.F4T4JF23X58I@gmail.com>
Cc: <bpf@vger.kernel.org>, <loongarch@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "George Guo" <guodongtai@kylinos.cn>
Subject: Re: [PATCH bpf-next v1 0/5] selftests/bpf: Enable private stack,
 large stack and arena tests for LoongArch
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "George Guo" <dongtai.guo@linux.dev>, <daniel@iogearbox.net>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>
In-Reply-To: <20261126055355.9967-1-dongtai.guo@linux.dev>
References: <20261126055355.9967-1-dongtai.guo@linux.dev>
Content-Transfer-Encoding: 8bit
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 09:53 PM George Guo <dongtai.guo@linux.dev> wrote:
> This series enables the BPF selftests for the new LoongArch JIT
> features, and fixes a libarena build failure with clang 19.

loongarch folks take JIT patches, so pls don't post
anything to bpf* until trees converge.

pw-bot: cr
