Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313062;
	b=VGHsFmSsMAxqz4pVZ4VLimnb1wViPF+lEQuJLGiOFZ3Rv8EiTGjNbRxDZMQ1u6oBBR9U
	 W5KCSJR7Vb01GxcOZw9o7Am8vHfgxrgRvsX6JgM2x1nzsdnpmiaL+U20qYkyXK9BByhd6
	 iEAWHtaicQ4jCJgKi7Q+GebJoKOBTXd911xLpFRxs4bfLqYCnS1Vr3ysTQxR2r99dqxXJ
	 A+v7pc1Z4b4RqiOfVh3Pb4HsbR/6PmOElnpFZiNz4cXR5Fe9vDee7Jlfp9rUMy1ToXmK2
	 AyUKqGYKmqOoxGiE6pq46gWAPfB9N0hryzezfmdw1oJ8Nu7OXuxzl5mzF2TUFWEBS4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=PjRDWUymC+7EL3JaTKRije1yqTzPKOHWaJhKCJD3MI0=;
	b=R8VuBQRtM3BYnTa4jLo5VBnjYZc3WVApiTI6Qr/iWMVuvKgiNnB34wNCgYlN0/zJi8bP
	 rgBmd7ZOBkFAqIAogUW3u9lr/sZ2RWf3k0YCNON4QAIm2KQNze3ewy6OOcnetTVQ/ISvr
	 Z8xqvkiRMglC2Jh5iDQg1uugALnJBNL70RUQbpnzJj2v+KQ4dggzprCRD1y9oRdjM+kaN
	 PkE/6jCcH1VTZ1Yi7Rd7zQRqzYacRCcECYD6cdFVINVwPUTcNA2SXmjPwIQ/S1H5991hP
	 1m+1NNn+F2uMd74O6B2iLaQLurd/W/xlraiEhpwr3AmCj3z2QT6L711Q0WWWWWYJLmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wvzpu0+t;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0341E606A330
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 12:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0341E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wvzpu0+t
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-49337a224a8so1808495f8f.3
        for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 04:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313060; x=1794917860; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PjRDWUymC+7EL3JaTKRije1yqTzPKOHWaJhKCJD3MI0=;
        b=Wvzpu0+t61nRjoiOefQ7pncURulhBC8DOc88+K9pNg9KLHP94Ys6S83vv6B4dXzEDX
         g9uv2t80ize0er/34/T182Ew6u67mMm1HZtOu7D1g+NHQxv8WoNVu21YmzST1qaGfLk5
         Tq433ltxfQflLgsSuecT5IXTyavrELHikXveNTXCbPmlD2PdTKwC6Cs52YVjV2I1bWhr
         Dw359xMHss7aWsKOdS2hRE7myIFs/m1EBJslgIcmPzD70cQhJ8wtPoC8LULYB2XX/kHu
         0qt24bFbSI8GGrRhLHdsx8JgwjnuEBN8nylnYMvddVaY9OjpbnQRX6n6h6vNhpsREtf2
         RIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313060; x=1794917860;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PjRDWUymC+7EL3JaTKRije1yqTzPKOHWaJhKCJD3MI0=;
        b=YtDzxsLgPhqpi2cEWOz2iqW7qImWJiTZ1SC6H4oJmAEYi5pGREqKdl6WmpOA2LrenM
         KpTF/CDPd8/vsSsrKo3+j4GFzawyktl/aDz7pDDuIQj9wZjK4EE152rcnDI8E4JEXfZl
         KKf5pO/2Vi0Hc+jDfue4RGgtvkmXvvmnkvq+57cwQD0KYHYmY+BQX7GWQ3B+KJVadV8c
         ND2H9aPzHLwvWiezqOTPORZ8sbR5RxLrQElh0s/aOzhRVaktiFWWIkYmTs83TEwmxZaM
         /SjtBReZ88tstYrfZhmGFLI4VM7MpPyTcs6M7BYiLmnba1PfIoS19/2I5BA6ZZbAGqNl
         FuWw==
X-Forwarded-Encrypted: i=1; AL+hErE0LkNj/dczolUuvpaGSF7qhvWNFAVv4qvcELjS+bs72uVBW/xrYxieVYFOi7N0eK1/XLXhbLYhV/o=@lists.linux.dev
X-Gm-Message-State: APuU4Z8p3xR6Y4zmmVId9YJuxKN7FgxgLT1P+cbaJOOx/SCW/NHmFsga
	Auqm1zIWNU19CXFmID6/HbDSyczR8zFCF+1mFOFigy1zZuHZEriFVY4p6/HJ9HDMjAUwotBPnQ=
	=
X-Received: from wmbc22.prod.google.com ([2002:a7b:c016:0:b0:4a1:8bbb:59bd])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:19c9:b0:4a7:c366:d791
 with SMTP id 5b1f17b1804b1-4ba02308537mr40596315e9.1.1794313060140; Tue, 10
 Nov 2026 04:17:40 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:33 +0100
In-Reply-To: <20261110121731.2728824-12-ardb+git@google.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261110121731.2728824-12-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110121731.2728824-13-ardb+git@google.com>
Subject: [PATCH v2 01/10] efi/zboot: arm64: Add missing barrier after cache maintenance
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Prevent the I-cache from fetching stale data by issuing a barrier after
the data cache maintenance completes but before performing the I-cache
maintenance.

Cc: <stable@vger.kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/arm64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/efi/libstub/arm64.c b/drivers/firmware/efi/libstub/arm64.c
index e57cd3de0a00..62fc8e53c8a0 100644
--- a/drivers/firmware/efi/libstub/arm64.c
+++ b/drivers/firmware/efi/libstub/arm64.c
@@ -107,6 +107,8 @@ void efi_cache_sync_image(unsigned long image_base,
 			base += lsize;
 			size -= lsize;
 		} while (size >= lsize);
+
+		dsb(ish);
 	}
 
 	asm("ic ialluis");
-- 
2.56.0.542.g3ef89b7020-goog

