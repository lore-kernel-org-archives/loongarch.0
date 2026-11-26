Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672449;
	b=Zfv/wzh027T7ZqcrXQotP64hRmWKmWdw6VJr4LbZlYjYzhEE5KQichScDhL/zanTlQw2
	 lYz1VJI4MiW+AUis+1oYIIw43PUzpu33LnOaypmnMs7CWWbsQ+RA9Jju6SmE2W/vytFW2
	 8+nBQ23q3evODpfsfgeNLcgcdvMF57bAQfe7H+Ab5LqHscNMZ3bNCldM8SW9Im8zW5TvY
	 48jw+NoibIlkDI3lTJtRCQS7NJMJbbMo66yCZ4mu30ztGElJFul2QrGFiiXlkrQ0Vu88S
	 3SZW4yXejtSRHLmxnH5X3rZQr9+tuX49TdudfN38I4XD+m3wAW65V8uFriyU+znbGPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672449;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j2bY7HxpteDRIW54QOotBSCLRb4icQwz1aDhsZT0FEI=;
	b=uHnPDTjmsPOgy/g8Wx6vLMqPdRlM2AI9+lcKr9ERzO4fQt3Ij+rY0Nw3z5JcRz7ZIbBd
	 iBxaNBoSt5dk7EdZMTkeaZOKBfkjCO5dlBkRx/1K/A1JhmZqo3jqsSOdKeVVtL3fISb7y
	 xTtS4qvB3IUEWqwftwsNhvKaP1XkgUgZPLbGeoU9c5oDXIguwF0DcxnxcazDOFxWSEsYt
	 6NQ5K7MwNM2eRYW8nDRYUpdak3GdtrCK5GUu1RGLKqkwOEbcImOXhMjSXtsunXRfSZUxi
	 MuT/igkEwrPWvdpDwpWmxfo/RdhlzXfsubG2blBMGfGGfVsUgUSwjk7Y2NDmAioN72A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LsaQaQ59;
	arc=none smtp.remote-ip=95.215.58.74
Received: from mta1.migadu.com (out-74.mta1.migadu.com [95.215.58.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2223606A32C
	for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 05:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2223606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LsaQaQ59
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=jmsocC4qJVABqWJH7IQKprNF8T0xRVsWcdRSae8/Y4I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795672446; v=1; x=1796277246;
 b=LsaQaQ596Qt8LzZZJxBXX4Ig2nSyKwU/DZuasjRqDh5/cdNDzQNHuMWjqQxG41pdCP3c5lgX
 D7KxtLtcubaq0HzCLPcmIATKTs/vowo3gfTlKh38nK5LZlE0XJiB6VtjGxUQCEOyvPxOQn9ZeJ0
 MVO166TxfXdFZRCEAwQKjgd0=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 05cc57f00654abf7;
	Thu, 26 Nov 2026 05:54:06 +0000
X-Mizu-Trace-ID: 05cc57f00654abf7
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com
Cc: bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>
Subject: [PATCH bpf-next v1 1/5] selftests/bpf: Use unsigned loop counter in test_buddy_alloc_free
Date: Thu, 26 Nov 2026 14:53:50 +0900
Message-ID: <20261126055355.9967-2-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126055355.9967-1-dongtai.guo@linux.dev>
References: <20261126055355.9967-1-dongtai.guo@linux.dev>
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

From: George Guo <guodongtai@kylinos.cn>

test_buddy_alloc_free() picks an allocation size with
alloc_free_sizes[(i * 5) % 8], where i is a signed int. That is a
signed remainder, which clang 19 refuses to compile for BPF without
-mcpu=v4:

  test_buddy.bpf.c:80:54: error: unsupported signed division, please convert to unsigned div/mod.

i only counts up from zero, so make it a u32, like the loop counter in
test_buddy_alloc_multiple() and the u32 zero it starts from. The
remainder becomes unsigned and the selected sizes are unchanged.

Fixes: b1487dc1b181 ("selftests/bpf: Add selftests for libarena buddy allocator")
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 .../testing/selftests/bpf/libarena/selftests/test_buddy.bpf.c  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/libarena/selftests/test_buddy.bpf.c b/tools/testing/selftests/bpf/libarena/selftests/test_buddy.bpf.c
index 886a09019566..00f1efe931af 100644
--- a/tools/testing/selftests/bpf/libarena/selftests/test_buddy.bpf.c
+++ b/tools/testing/selftests/bpf/libarena/selftests/test_buddy.bpf.c
@@ -99,7 +99,8 @@ __weak int test_buddy_alloc_free(void)
 {
 	const int iters = 800;
 	void __arena *mem;
-	int ret, i;
+	int ret;
+	u32 i;
 
 	ret = buddy_init(&buddy);
 	if (ret)
-- 
2.53.0

