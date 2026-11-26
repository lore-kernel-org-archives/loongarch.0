Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669488;
	b=qhPka9qzUzRLgYTyJ3EP3JlP52818MEg08ab6TRnOt0cl9bd6p79G+u1ah51mJuHyNzR
	 WcLDuum9HXCDTLd1AoVx4Q7Zz8sDkKNC/XjmzgD0rvs8j2oOgogzNQ9k9SGMbDIc3uURH
	 +nL4Ng0C6Yv/wDS9G7hQsPE9YL2crKKguz1ECUXy7RsQWniH+f1yJXj+pRe9RvDMmj+AQ
	 hVtNqMk7rXy8r/ZKW+e3t45BMBuAl6Ekg/3tHwiPefUoVC7vwK1spy9T9JYsD3iqYeO5F
	 7KN9loJ/2aopUcah94cc7Xg49mDA2rYdhBbelDBJU28Lejd5TfCqYEstVt2tSv3/3kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oswIDQIw5LddBDurs3uO2kKP08jbhDgi91nn5G7lxQo=;
	b=vAqKtZQ3Gj1d6sfdI/NxyeDmqbvMubhNpz98OA+1K8HXk2EN4SZc/oo/poGXG9p6fYN/
	 OiGWnAHRlbaRUMy9lIezSTDi8EGWQoJFtT8crWz4NXQjcYmRnF48cfDle7twACI2NsY6y
	 6ne41DqYfAYJAOgJ27atKtH/EP6dL2l7A0A018sBN9aMshi9HDtsjeSgvV0MVSVR4zd40
	 +nQr+ECMPkbT3BHKJ7Du3CiHiojwFoBTF9SICU2T/KphhloOjIqRUObxjJVX9rvTelLMm
	 0YhZt4f4noAIDvkWHlENkV9I3UpgW3jHQbAJLJjbs2AE8MCZKDSfVbPa560P5rZN57w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VhPsALVz;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B71606A323
	for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 05:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11B71606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VhPsALVz
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-386bd881d39so6154100eec.1
        for <loongarch@lists.linux.dev>; Wed, 25 Nov 2026 21:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669487; x=1796274287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oswIDQIw5LddBDurs3uO2kKP08jbhDgi91nn5G7lxQo=;
        b=VhPsALVzU8Bzl4a6IXoHwNGgJPLxFDe1tqxWa84kT4MyS4jx+k6QtzAP0FDDWEhI+i
         MQ2K80FCT1rugWLUTJbBQhRQr3/qnuyljTiatX5pcI9WUJGRDzNm4OOlq/LIRgzA4ovX
         s9GXMlEERY0n+NHKKT+WsAd7qryUiU/A6kHLS8MqmOMYleO4eAyHqI1rkskDqE2T0sWA
         tu1E7LmGQMazL8rxcyUwzHVQq20YPvxNCMVQ0z5g0nR8aIvbmEHr8zBXvglIiEap+ZDC
         TECH4l1w1V+elhXgYK86B5s/UXSrOTzWXJ3DOSJAemY4ioUcG9ywIfBkO9XxGgQIujvk
         198g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669487; x=1796274287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oswIDQIw5LddBDurs3uO2kKP08jbhDgi91nn5G7lxQo=;
        b=FvCrx3xc7m3wHpohid2PyCsf2qx+Ubm9vZHxj6ZuVKQGuhZgnyWBJoPMslY0MTqAzE
         N/YzO1fLzYfWvFGx9momGgEtywakb2yixO8edeCE6paZH5YbeHvh6aeYIjWTabcozWsY
         YBp5VTsTu25aXNR2KXeN1c0nm4i9SuGhbqHrbsuEGBQ+8oesQKPfZnO7+8Fg3tlk+x0/
         jEGuYXCLtHA72D4iQQPjNtFGeND/N0ZGhqKp2yHpfJWrXypnXiMHQnPJP9WGj6uqHJ8T
         2IFczh0lVTuTxXxFGYwFecbM+jAEp0WvNgaT8gsKZfS/p1x51S2cdyamlUkQ+zUiW+3O
         295w==
X-Forwarded-Encrypted: i=1; AL+hErHmr+lYFFAOad4034vplzUULDCKciAZsPz+ySy8ManGr//yN2UQ9lH7kFdStbaIsTEmQTgP3J5rbcc=@lists.linux.dev
X-Gm-Message-State: APuU4Z9ZBpYY7Fo6zpPTAF53+nudV1pFXUw+nuxi1pw0AJpA+B4z1m4z
	mJe6lpCrZKHPcD4nEQSv+WzOQimhtZB4mudAIEHolAuAZWnLIK083cA/
X-Gm-Gg: AZFdTZcxhDc2/pc//g7oXZTeAhjeSDGF3XGFFQhWQTq4mMTvKPUbjxDYRhqxblghlkC
	xYdVT7CCZSrdH99Q/GeuDXHFGFAXNGBgd0CDKU+zxN2iRRUdPmDz27y00ZptXFgjNoyN+eArHpU
	U52ZkZbgFnUR3z1buKa7r+u8Dk7SA1cxGgiSUVqh3VKMKNEFJUk4SXReIe+0cMv4+a9qs9U5WXn
	hyDssV7DfdKulQx7JNQHYl9lidv3MMoMMxGRYX+OCF8U3tFOEbZSp8KvBH17TthHaUCZcqSE9mx
	TqQ2KOrhdMH14fXCaZZuJm4hxjGYP2+QHx8I3ZjI2s+jvzbObyaUCSrSrpR2XtoRwGwV8mOvnVp
	FRfWVk+gqseoVT6llSUI0pgrvHsp4s/cIHBXGg3POpwevus2t9V38moH4suJT/EJb8gzBk/MEVH
	FrcgchS8OgoSFZlneAqo623d/wFyEBfePVD8ahjphsOXpCB9IXIQTK95bI5ktOUbQxcPrfkG/CV
	Rb62x5HQ8YT2SD2yaEPKflOiji9nURmr7ObqL2Q5sW/9U5wwSyFAsO2Q2y7WqpAQuOoKZq/YU2S
	TkxE0AztO02hXQ5LTF6+YkNl7t73W08ZTsqCB9ys2g==
X-Received: by 2002:a05:693c:60d4:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-3857111f65amr22517783eec.32.1795669487141;
        Wed, 25 Nov 2026 21:04:47 -0800 (PST)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm17154865eec.17.2026.11.25.21.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:04:46 -0800 (PST)
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
Subject: [PATCH v2 2/2] KVM: LoongArch: selftests: Free the VM when the PMU test skips
Date: Thu, 26 Nov 2026 10:33:52 +0530
Message-ID: <20261126050352.1957454-3-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261126050352.1957454-1-gokul02k@gmail.com>
References: <20261126050352.1957454-1-gokul02k@gmail.com>
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

main() creates the VM before asking whether it has the PMU feature, and
when it does not, returns KSFT_SKIP directly. That skips the done: label
through which every other exit frees the VM. Set ret and jump there
instead.

Fixes: 11c840192768 ("KVM: LoongArch: selftests: Add basic PMU event counting test")
Signed-off-by: Gokul K <gokul02k@gmail.com>
---
 tools/testing/selftests/kvm/loongarch/pmu_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/loongarch/pmu_test.c b/tools/testing/selftests/kvm/loongarch/pmu_test.c
index ec3fefb9ea97..c9dd3cf5de06 100644
--- a/tools/testing/selftests/kvm/loongarch/pmu_test.c
+++ b/tools/testing/selftests/kvm/loongarch/pmu_test.c
@@ -176,7 +176,8 @@ int main(int argc, char *argv[])
 		pr_info("PMU is enabled in VM\n");
 	} else {
 		print_skip("PMU not enabled by VM config\n");
-		return KSFT_SKIP;
+		ret = KSFT_SKIP;
+		goto done;
 	}
 
 	while (1) {
-- 
2.54.0


