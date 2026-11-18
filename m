Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026106;
	b=22Ezp+6Cx7CUfCcUixCodnwmyvDfByDLyOC3AgM4qioJoUqgr3+p918wGXdI1CRn2YA/
	 D07qXGL8o53Qf0edyJU/YFFBz8EA8uyggJO/er88jt9IY/nUMwIey2yaEktW9iOSFlPk3
	 Hygfe0xlieh4M0v4+2CCSjDWlWPpKGsfkuVuIYSBozuDcFq4ViwYkDwWArKz/h7X54bH7
	 8p10k1bu71OicUhCPZvSCM6G9smCezGqrRJr2yPyFmSbMwr99QVXZHHEF3meFtO5xW5av
	 KqGsxbiNqv09Aq/Ee92d+19H4H9JIXvN+sxmL5n4YDS6JyKO8TWvzChQ5jp+xzNG7cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=DiIv3B/kInSJlpauWNEdFhsRn5B5HF5NbCxXGwR/mKY=;
	b=LK5EV3Ry+H7fKMzRZjoAjoNJJPMzD236bwe22n25dp6ofl2W3EYcIAeuIYtdsiPhTFMg
	 WZvC5RE2ZfgTIPME4twlowqXbZtEnwAZEnb11F0jzs3H6kQUm7xKF21kgKH1mPVjw60gn
	 nAeqHbU3969M0qtr/z/kuRPskXLSUJoKvnlE+ouvGx3XT6t20n2VbOva6paRf7eKhjLxE
	 3YDdA9bgoJBDjSdEzfCbpwC0nKzd/x2CPVz2yWSOAr/0DWMAJHgdcwerbPh3qQoJy2IsJ
	 DeBsmMAZUbize3tBEV0WCzR3H2EDZV9KFoDr/f8XA9KGuyW85IOwIVTQOrEC/MRq9TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pbbe2ZKS;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04303606A33E
	for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 18:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04303606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pbbe2ZKS
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4923b9fdd43so1057150f8f.3
        for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 10:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026104; x=1795630904; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DiIv3B/kInSJlpauWNEdFhsRn5B5HF5NbCxXGwR/mKY=;
        b=pbbe2ZKSXkQotpDRD0wEcb+Rw2Gmj6QFPdAQraRBzG5SPAAP2RO+tSrk3RH5dhj1Ph
         ItW9n7zFxFL2+mKOWEDHp2TWqS9HznL4c+7rMwjIHbc1Xp8A+CcbqIzRAaD7SWkHhgj3
         rHQ9tc1TOBmt88ATF1L4UJgfB0L9LWcF/VaOzfxt7WhzcoLE3F2k9YEhDkQ558gSfTFC
         0Ps64LsdFPUifexbsOPR9SjZoKNqlLsPsAm15QpeVa/vdvDOFXKU0A50wg+YM8J711nA
         NZVH3NcFDodXoHEtYCfcZoZcF4HxTW1valPZdZdJXRMOsPLjKynxZlVF2VCMBdPgE3Ns
         7Lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026104; x=1795630904;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DiIv3B/kInSJlpauWNEdFhsRn5B5HF5NbCxXGwR/mKY=;
        b=VYxlTCCTCk2eMtuwBzyDvKOHGQB6OIdEcNfnxuG9pnIgXORfs6X07esuA7n7owpxVo
         NVC7zUgmCfA5EsJXLOCEoHW0pdgox3PF1XUK0TjSQpJazWbNSQbB6tyU61YPw5K1qM1C
         zOd7hRA+TlK/PAeuoFCy/k9SHHplqD7O+uNpLL1Q8bDG0J53qVzJP7lSr2iP8nrM2b/x
         eFOEww4EfXEecUonUoHTKZDddQOV36Gl7mA/NwUHgCzzISdlwCLZxXlCW2m3/qQcQp17
         W3HrMahZylrgurIsyXF2nKbhvD4D3h1cfq8HvXiGBBaK2PjvLeWyWubdlRQ9/cZT/WqP
         9Mfg==
X-Forwarded-Encrypted: i=1; AL+hErHhYhpjQoSJiQcFfmDfYBKj+SCOHaTZ0Dtyzrp4sJeAuahakDT5PSjMJrKLJZVegjz/oVnjNuRwOYs=@lists.linux.dev
X-Gm-Message-State: APuU4Z+wi96A9zdIf932HoCyaRZT0tcfQ1N8l9wug3isXDwCzDHFoifw
	xlgqVEejB11LgtqtD+IqpaSNZvB+dch9vXsoZ1Xaj1n09Ypr+2kV5kkAnnpKZ9JDjEqJ3TOAYw=
	=
X-Received: from wmte3.prod.google.com ([2002:a05:600c:8b23:b0:4a1:e44e:ffd0])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e87:b0:4a5:75d2:c104
 with SMTP id 5b1f17b1804b1-4bb7da2db77mr71528935e9.22.1795026104151; Wed, 18
 Nov 2026 10:21:44 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:07 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=746; i=ardb@kernel.org;
 h=from:subject; bh=jR9RFbU1DFXzsLcPrZ2t6cFJ9as3lkmb0r9/e4KUO7w=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm8mi3o96JorGnY3c3uniWlKh0aATKFJUMr3DnsWB6
 e3err6OUhYGMS4GWTFFFoHZf9/tPD1RqtZ5lizMHFYmkCEMXJwCMJH6v4wMyw6xcJ6b+EzmOFuT
 1Y2f1xcdyl4ravtF5AjLUUZhfo4b2xgZug9P0Xhuo8DAeP2t7NXOJuVfV/crmV/992mTwjnDW54 WTAA=
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-22-ardb+git@google.com>
Subject: [PATCH v4 01/19] efi/zboot: arm64: Add missing barrier after cache maintenance
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
 drivers/firmware/efi/libstub/arm64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/efi/libstub/arm64.c b/drivers/firmware/efi/libstub/arm64.c
index e57cd3de0a00..d35c6dd76601 100644
--- a/drivers/firmware/efi/libstub/arm64.c
+++ b/drivers/firmware/efi/libstub/arm64.c
@@ -109,6 +109,7 @@ void efi_cache_sync_image(unsigned long image_base,
 		} while (size >= lsize);
 	}
 
+	dsb(ish);
 	asm("ic ialluis");
 	dsb(ish);
 	isb();
-- 
2.56.1.708.g77570a6a1d-goog

