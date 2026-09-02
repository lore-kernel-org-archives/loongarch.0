Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A004B3D3CE3
	for <loongarch@lists.linux.dev>; Wed,  2 Sep 2026 07:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788332882; cv=none; b=auv6i0JlV1G+2OdL6gZIW9ojrijgSR4jRNSzNVoLL61ewBYVlv2vMfhaOaQFeMTLQ5Dwy9RB6BiyMh5eehCFbb3fzFww2tvL6YEstcHTQXw+WTIuYAul7+e5G41aR4yZSOCfdDVSd1WzMDf/uljH0bJlUnCBG41NkopS9JIFcMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788332882; c=relaxed/simple;
	bh=E2z5VxL5Xw3RGt5v4/KEBpw/NCagZi+Ml/JNW74PJmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V6DUWgs40xowQJLywdebdAGBracqD8pvdjILtyilBSxnY3o0cdmqrO0Q7Gmd1wjE2CzkJ8xgO59CwLiynhxABYo4riyqyZpG6IqNP/hH0/Qh9Wjc592w4HymZ+x2wjSiYYk1zmqkLV3SEArEHwcAAkCjNRtbFfqkneIEin+qJJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G89GU1Ja; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G89GU1Ja"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38511175ad3so759696a91.2
        for <loongarch@lists.linux.dev>; Wed, 02 Sep 2026 00:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788332878; x=1788937678; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klWnmBIl39G/xBabfLBKbtaRH5w80OJ8IP172c6Po0A=;
        b=G89GU1Ja5s6k4VnI/EcC2Iv5Tmoz/PO85L/f/Coo/DtFT2R9iC5DthdOd+7lBu3O+z
         vKO26rbIqlLceoiP/ucOXtqTy4VOJGGEqlr/5duA7ax6EeAbFvxPXrNHM2BKZUkQdmos
         +BrZun0OlxQYDJhuuFkRhs4aUJgjQ+0Jv4akOcowSSBhXPpx9zbfkLGjOQnQjhph+XWu
         /gltL0xnK8yoO92B0+Jr/pKCprCuwQimYb7Rz/i25FmOqjgijyDQ7xWRbjpCRdAhcJY3
         XB9LUgeW1NiZCtiUvs7EZTngCyoMgfjQ3H6ZycfPnAN+47OqBaoAQFHov4LEUwGRWWZr
         qLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788332878; x=1788937678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=klWnmBIl39G/xBabfLBKbtaRH5w80OJ8IP172c6Po0A=;
        b=K9AktrPtzW7GWBUK0jS+RBx5uqiBLftHblqarqbSbEvZjKnsRwfCoavZzRxT+F2gY9
         iwZeNHau9kbc7N25ZecfRXaeWlQJgyDfjQlE0mWGgYnomSBJBiGZVuoAASpD3i8pUrYi
         QMtjHSBotEM03q92qxL2+mMZQnAlAjgQ1uRwHuMVdguGugpDn/K6a+MKfpo9z8EnM3PE
         VFWzVlwnSCA4TJZZw2Fp7pApHoKJnjw6ZGbF2GTXlGrzQp0ROgPDbIjlIRECXqYFh2Gk
         jgK9Qo6O3bW7Da32OEd8+0dGtFNHkw6MtbGSU3cQHJcEBpBkoCfow0hM5ioGn3uesXWp
         Szuw==
X-Forwarded-Encrypted: i=1; AKwUvBzLGyfmytJcj/73cFInLmMpWLJR/7Hchew+zfAgh83H6CbZSR/mj05AXF5qdi8n8EmgxyVDcWoe0lU=@lists.linux.dev
X-Gm-Message-State: AFuF++lHCS7wVDBhM6CdCxVrpooDJpYo9QOVF/Yt/2NXmSlFaqeefaEb
	tGCMiX/IyqyeSGiQoZvbdKv7bLEIr/BuyCBYa4EB0G5kxTKCBQOnav/u
X-Gm-Gg: AYBFou3eMjlCMyswKY/eU0p+N2xUV8Q2D2tKR0muQlOKgWvMXnjBnv+ew++F/J2L/q/
	o+6niBZ/imLP13TIS7nzbvWGlThqeMN8ROnu+rfB8Kli31PsPvcMOE/kTa1vq6z2B/U76LEfd09
	bc36PdlQDNUEddgGy/Fb5B/LwsZqZl1g4Zo5D/AIB7xNJ4PcLWsB/LofJWHx7kFwmfX1j62zvZ8
	XeCE/JScqIi5Mg+QR2rXI2UUL36hBw1yKCKVHfuRSFnCas5t6sg3Mg5VwH9ZmAQmpev1FDxSrx0
	qr3idO4YGDnEKrSOa6UyjVWcUXn5qJLSe2oyxMa2oVBTfYUCl00YM+w0lWEeOgRG4zjjiziMxUi
	CuGTFASyPHLp3Vk8OJOxTKRsByhl4VIBy6bxDH8n138cgRg0SiGFKcqb6mGAgppTuJ6YnzXnazA
	kJfd3t22RFQK7SBdAivQgkUPeFsVvSbSikcOMmel4pxFRJ/0fZOZ6GiyuVj45REfN1xGmgSO7Ba
	Q==
X-Received: by 2002:a17:90b:57eb:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-39aedfcc06amr4377236a91.6.1788332878001;
        Wed, 02 Sep 2026 00:07:58 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079c33f4sm4173256eec.1.2026.09.02.00.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:07:57 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: zhaotianrui@loongson.cn,
	maobibo@loongson.cn,
	chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	lixianglai@loongson.cn,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: [PATCH v2 2/2] LoongArch: KVM: Fix resource leak in kvm_loongarch_env_init() error path
Date: Wed,  2 Sep 2026 07:07:23 +0000
Message-ID: <20260902070724.3459457-3-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902070724.3459457-1-nagachaithanya9911@gmail.com>
References: <20260817115847.2705791-1-nagachaithanya9911@gmail.com>
 <20260902070724.3459457-1-nagachaithanya9911@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kvm_loongarch_env_init() allocates the per-CPU kvm_context (vmcs) and
kvm_loongarch_ops, registers the perf callbacks, and then registers the
IPI/EIOINTC/PCH-PIC/DMSINTC KVM devices. If any of those device
registrations fails, the function returned the error directly, leaving
everything acquired so far in place: vmcs and kvm_loongarch_ops are
never freed, the perf callbacks stay registered, and previously
registered KVM device ops remain registered. kvm_loongarch_init()
propagates the error without calling kvm_loongarch_env_exit(), so
nothing else cleans up either.

Unwind the error path in reverse order of registration, so that each
failure only undoes what had actually been set up. Use the same helpers
in kvm_loongarch_env_exit() to remove the device registrations during
normal teardown as well.

Fixes: c532de5a67a7 ("LoongArch: KVM: Add IPI device support")
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 arch/loongarch/kvm/main.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
index 3e1005526f4b..c9cb3fc2e560 100644
--- a/arch/loongarch/kvm/main.c
+++ b/arch/loongarch/kvm/main.c
@@ -385,27 +385,51 @@ static int kvm_loongarch_env_init(void)
 	/* Register LoongArch IPI interrupt controller interface. */
 	ret = kvm_loongarch_register_ipi_device();
 	if (ret)
-		return ret;
+		goto err_env;
 
 	/* Register LoongArch EIOINTC interrupt controller interface. */
 	ret = kvm_loongarch_register_eiointc_device();
 	if (ret)
-		return ret;
+		goto err_ipi;
 
 	/* Register LoongArch PCH-PIC interrupt controller interface. */
 	ret = kvm_loongarch_register_pch_pic_device();
 	if (ret)
-		return ret;
+		goto err_eiointc;
 
 	/* Register LoongArch DMSINTC interrupt contrroller interface */
-	if (cpu_has_msgint)
+	if (cpu_has_msgint) {
 		ret = kvm_loongarch_register_dmsintc_device();
+		if (ret)
+			goto err_pch_pic;
+	}
+
+	return 0;
+
+err_pch_pic:
+	kvm_loongarch_unregister_pch_pic_device();
+err_eiointc:
+	kvm_loongarch_unregister_eiointc_device();
+err_ipi:
+	kvm_loongarch_unregister_ipi_device();
+err_env:
+	kvm_unregister_perf_callbacks();
+	kfree(kvm_loongarch_ops);
+	kvm_loongarch_ops = NULL;
+	free_percpu(vmcs);
+	vmcs = NULL;
 
 	return ret;
 }
 
 static void kvm_loongarch_env_exit(void)
 {
+	if (cpu_has_msgint)
+		kvm_loongarch_unregister_dmsintc_device();
+	kvm_loongarch_unregister_pch_pic_device();
+	kvm_loongarch_unregister_eiointc_device();
+	kvm_loongarch_unregister_ipi_device();
+
 	if (vmcs)
 		free_percpu(vmcs);
 
-- 
2.43.0

