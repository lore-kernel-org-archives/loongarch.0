Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669474;
	b=Ejsu2PA9qhyCOsvdTlE89hRKvmU/ak1eAn7suJLojP8YzkFONp8l8xt/Iu0r97THdFv7
	 mOXO+E4X8dOtqP+rrsLIh1VKOymzanTCvUNLHC9dr5Qrgm9S2vRllKe3cWLS7LiojX6gQ
	 Cd/GSJVEiz7nXP6h+YFJTnLoiBXSheWFLrTfI4xqbQfz5iN7FRT00JlmM/2aR0UIECmRZ
	 c8Dz8+nfk3KLlZgfQkB1hON3b/howAHAcvXFNrVuwL5M5B5oROpKGWxLaDBgWnqvyAMhQ
	 2BpWYBEhz+5xcNttN+JrkajdZwcR5XMq0vNE/SQZqcxRiYbZ4Xf7BbYzVxwc0sMmkqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=crGGYNxEXyJKntahkm8iE1ek1YTEyGg3pNiPWsgpCVA=;
	b=RA8+ZyxwFrXQQiokEkdVmXankXh6YJIkNz8jXg8hgZ6E8Avo+y6Y0qfJSwNSuH+4pJOd
	 0upPUeddZWeDVH0gfpjmy4VJtK2PGKumTAMoyu8CLsWmXOH3kZAGw3ZhP4VcDrtxQkpmA
	 uxXiqqPrgNnDSkyWzK7ZVgpEb/7PvKr2t6YEcBjcfXhCV81rQTKJuMVxhc86hhSGvoUjr
	 BvT6YHMgrpULcWMBQpliqfmpJQd3w9tP2YhIuGiH8ZO9qY3ewXClpNJLTCcfGCeJ2AGUD
	 zoKmzmzKWCJlkJKoXr7NJNM2WNUX2n46EOitKwwGIOF8D2u7645jTZb13m/2St3VzXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JxOvAsOT;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF87606A321
	for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 05:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABF87606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JxOvAsOT
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-386cf1041cdso2764617eec.0
        for <loongarch@lists.linux.dev>; Wed, 25 Nov 2026 21:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669473; x=1796274273; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=crGGYNxEXyJKntahkm8iE1ek1YTEyGg3pNiPWsgpCVA=;
        b=JxOvAsOTjV1Xkbma37+55qbfUpSe2Rz1zTVXndMsXv+vZQ2/6Ivng+aVUQI8K8IEJE
         L/b93fGo4sf9cEohXwDuj9wzehtBztLniGh5h2MfcZv8GQuCfRAWvUol5sURYS0PhvYG
         FtRvYwqC+dQVWfh2rdp+Ktn/T3dPQ2tzqbdzTlbieHVNmvikixkrak4e9B3vqbvRanSX
         bFzCt+q3Xy/Hy4jkzh7NEKqaYHG+Ldp4tzKIkm73mlF6VOdbyCUKaCKuc1ch+FOrk8l0
         M9zqUa7wKlKy2bgwnb3uE47BXyiDxruWSqpU8IdVz/0cufDN/Afw9/TbtKEZUweF9vds
         hIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669473; x=1796274273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=crGGYNxEXyJKntahkm8iE1ek1YTEyGg3pNiPWsgpCVA=;
        b=c4Z1sxY0vS5nwYg9jqFosmnY/F1mYOVfrWGPNVc4wbjQmfHlzaXS5c4OcUwdh0pNI/
         mBEFfgpkXz0KL3ur4eDq3u1I2ZcLYknBp6o2Of5FU3WeEGeVvgWG3qbBulvT++lyxYET
         +TXlF5es2W3KfGai6sKqh36ckr2lvasiuxnlo+WtdtlbS76PBJgPLA9jVGYd9ejHjBI1
         YFV3s/yPByUBRZ//DUDKz9BEhRrAmWvHT3bAlt1dm4HSMQsmTRp4UnCPiZOj5ERQYJcc
         tn10t/9bcG1elWsv9VpWPLja/W5/Hm6lTmMgW8ty0pw1JrxrDl+3ZHhq686gDVYFxQc4
         sokQ==
X-Forwarded-Encrypted: i=1; AL+hErGmG/QJ6SCxWZCnYnU4C+RFoeSO/7ekStUgCqleg5rQAsZH1YbZS64PCEWZcu22yE4+duoq5xcbgUQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z8D6Heq2wT5UtNN2dwhPWu4tSLwQqnVBX9ZZnWEf0+ZvAt+oVVg
	WPamSQuVNISjzV3BO1MQxJYmy5svZdBR7K0nS0BxB06iVLNkhVxqKCMJ
X-Gm-Gg: AZFdTZcZ/soRXnD6DDz/5de9SxS1wqps+50zXE4Scyqk7hKgGNsh24TLZO2Kp/G8H4+
	jgR6LJKL92nXCZC86iM4fGrKL8eIsDyg7FowOZiCy8YF4Fy3YiXmvMLJrnQsD2zpV6xvUttOEVT
	36DJmSRDl1neKytV2nvjZFlLjULxz/DY4nzQWIhabbW/kHNzscep9piI5Xecw9z1DeV8fynVr+E
	UDOQ4YnAWSMm9fOVYKVFMls2bGtYEeMeTauINr1ZMjQZRhNuS0efeSWKck68IzkjnZpQob/hoOC
	/uUIuvk00yJSIod4nZnuPGILC+H4YPSLph05rNMEn+gOZOME9gTW+yPMS+jLXrGN1hYfFFxezay
	UGUIi2pbqRIsx9QWcF0ZAI1pmzhkmjZu+1m8JNmwB66RRS7uKFwQdRQEB7jE28NSv9QtLOwTNz2
	LQqiNDhm+EL3MA8/qpL7VOlZ7uh8k3X1z6zsoSqUAnWyae/A7fLE+LaxbZtcEAqo0nxmV5KE8VD
	Pyt/GOrLG+cC0OxRvdJsn3LMRkTI096jbC5T7xGHlqvAperFhjYN15pFSeWb1ovwxPwYccZFnRI
	W4DghGjb45ME0aVY2AiB87PtTIXcIeE/MiyQHbqcVQ==
X-Received: by 2002:a05:7301:714:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-3856fd5e4a4mr20736555eec.24.1795669472707;
        Wed, 25 Nov 2026 21:04:32 -0800 (PST)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm60776540eec.28.2026.11.25.21.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:04:32 -0800 (PST)
From: Gokul K <gokul02k@gmail.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>,
	Song Gao <gaosong@loongson.cn>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] KVM: LoongArch: selftests: MAINTAINERS coverage and a VM leak
Date: Thu, 26 Nov 2026 10:33:50 +0530
Message-ID: <20261126050352.1957454-1-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two small fixes to the LoongArch KVM selftests. Patch 2 frees the VM on
the PMU test's skip path. Patch 1 came out of routing it:
get_maintainer.pl did not name the LoongArch KVM maintainers for
tools/testing/selftests/kvm/loongarch/, because the MAINTAINERS entry
does not cover that directory, so this series would otherwise have
gone to Paolo, Sean and Shuah only.

Based on loongarch-kvm in linux-loongson.git.

Patch 2's hunk sits next to the one in "KVM: selftests: Convert comma
to semicolon" [1], which is not applied yet. They do not overlap and
apply in either order.

Compile-tested only. Patch 2 builds: tools/testing/selftests/kvm/loongarch/
pmu_test links for loongarch64 with a GCC 15.2.1 cross compiler, using
glibc from Debian's loong64 port as the sysroot. The binary was not run.
Patch 2 changes the PMU-not-enabled skip path, which only runs on a
LoongArch host whose VM config leaves the PMU off.

Changes in v2:
- 1/2: also drop the lib/loongarch/ line, which */loongarch/ already
  covers, so the entry matches the other arches (Zenghui Yu)
- 2/2: unchanged

v1: https://lore.kernel.org/all/20261123100701.1679376-1-gokul02k@gmail.com/

[1] https://lore.kernel.org/all/20260428053204.1018608-1-nichen@iscas.ac.cn/

Gokul K (2):
  MAINTAINERS: Add the LoongArch KVM selftests directory
  KVM: LoongArch: selftests: Free the VM when the PMU test skips

 MAINTAINERS                                      | 2 +-
 tools/testing/selftests/kvm/loongarch/pmu_test.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.54.0


