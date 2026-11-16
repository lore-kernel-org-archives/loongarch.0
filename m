Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839237;
	b=DL8kJNdOZ+vxnstbN3n4KPa/zNm+AlPr30f5vFamau7lmpJtjlIKQYUvJaAtg65D1lVE
	 1AjB6QQGuDqiIe9uKkEgdWPMwa2CUrL18iS9pWD5pjvjjSM7dpJ32FW4+P2qGJoWiKHFp
	 rMG9b9ZUDcJU7+DYA0BRIVgj0Kf7f7WJRqZB0TnqO/BUht60skeIWiCXj/hUsZUSPsp+l
	 qQ70+r12ofSNf50xs4acSCtzBoBeg7ZtUq44DL44D9xzlE8+DeTgIWd/zPl6xbcRz6H8l
	 lTptttVWINWt66zzKR9Muw/s4DC9FsQUhdKrxEBgRpv91oeYSg0oQ+SZIpCoATJEhcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Pus6Zon9bBsFufoopNpQt/nFtp2HWtzZyOc0mElYIXI=;
	b=Vsu4l5FtTlQ1EeedXb1QmIUuhgzQHQx/+YByVzFcKZxdcKvlN8XpBBCGcsI9pxQ+lG1p
	 0FcSEmWbVkRMRyYyLQk/cl7lbIfANvo9C82dBiclAB8OFqzMYvqgAJpUXp3TQUOxt9We7
	 vL0GTKb5vwK2ITZqGwsASug7xwexsp6KXCz0eZR12pBNnSK9sIX9Lzr7DIlgYSArxvCwY
	 g6Qhj0L9XcxyaHl9krCIhheZh1itThykn9Z316eMy/ttmWxfkuudaQSBSnVvkUbBxaLqA
	 x5aLRy+mrNb8ROwslkWKyMIkd0gAqhnFcEXzo7JXFd9PmVhbsh1Fu7d38UTuNj/Gnqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JwPOz9Z4;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B399606A32F
	for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 14:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B399606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JwPOz9Z4
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-490c1867460so2194229f8f.2
        for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 06:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839236; x=1795444036; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pus6Zon9bBsFufoopNpQt/nFtp2HWtzZyOc0mElYIXI=;
        b=JwPOz9Z4Tvf6+Zsb3sGeOZU7v4ezuW6mhqMu6MWo+suiq3ogRA1GdCnT/gbcj5FBWC
         xnJksdhcjiR67H2wXSoALNmJHxyH40jHYUXc10H8dXUuo/m70rVxI+saGEsUIaGPcGgd
         pPd3OKhWluoszLVHorVKnhLemo0brhR9wEbPVuug+282ow6mRmfMvQdBwLpApNSQeCXm
         YaedodAtpn7ciqQKoQcRIEwudku3ieJonRB7FVe0IhpH3C2nJH/yDO43hK4DQS08d+LI
         Zsul+uPxLZskSilMAmNjYNF53/el+/v0LKLQk95UlYnxgymuuYQsbF+aNBg40v+FgdPk
         Ghaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839236; x=1795444036;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pus6Zon9bBsFufoopNpQt/nFtp2HWtzZyOc0mElYIXI=;
        b=j42KwuE4+TsXneCcKHImZGEpMYFokQbjQ4IbmCFy7zB1hOu4VqYawdIWxn0VN81vaw
         0OPlYwNl26BmUndCv6gh9zzsOepxWPq2SrAMQWceJph+bxkzoRZeB3CKRVeqcczd2tQc
         /IjnopFVpUl3655V48R/sl2rrLgJn5tiv3SkdWM4/3kuduoxnarvEMS2InttclDdFCss
         jVTwCspy3HKHU1B6V1n4K/4CF4HgviPHzQOeOwmTliPCeAaCGGe/+vQQ20YTT9UZjlOj
         sOGw1aIufme7CsrTHW5Ki/Av+VMlRgDz0tP3tZrGwQhZSz+Hltxho7+NA3MekZ2fSMa8
         gBug==
X-Forwarded-Encrypted: i=1; AL+hErH/PW4I5R8BfA/3Nmgu1URvNWgcjh5yHYXl/TyT7UEAjNIhvN2q3FYbhSpq63yjEIopF0Yx0XenUEE=@lists.linux.dev
X-Gm-Message-State: APuU4Z9ZyD/BBgJAFdCSGxS8YRsnh198hrvQE6IIGxJagAgaApBiytM8
	9b1uqQ54eD34NV5gX03UPIUjgFRfBqjvzifZu6b3CbIEgl0Xhbow7gbbrqWp82yPHWjxYk5LiQ=
	=
X-Received: from wmbjj17.prod.google.com ([2002:a05:600c:6a11:b0:4a3:5d5b:9ad9])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f81:b0:4a7:a5db:a93e
 with SMTP id 5b1f17b1804b1-4bb5f3f7efdmr165201905e9.4.1794839235418; Mon, 16
 Nov 2026 06:27:15 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:22 +0100
In-Reply-To: <20261116142618.1687025-17-ardb+git@google.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261116142618.1687025-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1529; i=ardb@kernel.org;
 h=from:subject; bh=A8MzxjCVv4eM6mkH8sNsgPFkx7gf3UVeNfnQwzNCuhw=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu3UH+bU9CjRLa86aIH37lv1jSRj5ac/GX6sgW335eei
 XnJtiS4o5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExkww9GhpVnbigaHjHPy5/x
 T+3HCq6Lcfahm4w+9y/uK7/85oP80ccMf0Uu3/pS4j2j8IbsHeN/EQ3LQp32pvoesD+jcquOmev MfjYA
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-20-ardb+git@google.com>
Subject: [PATCH v3 03/15] riscv: Make _text point to the start of the kernel image
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

On RISC-V, _text currently refers to the start of the .text output
section, which is placed after the image header (.head.text), and is
therefore equal to _stext. On other architectures such as arm64, _text
refers to the start of the image, and is used as such by generic code,
e.g., to describe the kernel mapping in /proc/kcore and in the ELF
headers of the vmcore, and by the EFI stub.

Now that arch/riscv no longer uses _text to refer to the start of the
kernel code, move it to the start of the image so that it is equal to
_start, and the distinction between _text and _stext is the same as on
other architectures.

This also means that the image header is no longer omitted from the
/proc/kcore and vmcore kernel text mappings. Other users of _text, such
as kallsyms and ftrace, only use it as a reference point to calculate
relative offsets, and are not affected by this change.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/riscv/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 1f4f8496941a..9849a3e4d102 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -28,11 +28,11 @@ SECTIONS
 	/* Beginning of code and text segment */
 	. = LOAD_OFFSET;
 	_start = .;
+	_text = .;
 	HEAD_TEXT_SECTION
 	. = ALIGN(PAGE_SIZE);
 
 	.text : {
-		_text = .;
 		_stext = .;
 		TEXT_TEXT
 		SCHED_TEXT
-- 
2.56.0.611.g1030f0b940-goog

