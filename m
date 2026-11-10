Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269029;
	b=rFm+Y+5xB6vW06rIJxJE7sNqI3DKIdl/8Rds72Cdg70dMJD5G1+oHdyixVMEbCQm9T7P
	 teYikCRHdEssWipxMIOs1irBMhSF0ScTCG9UAZm3x+wWsuQ8c1aokr6Pem0RfQYLaX2J+
	 FoQt5ZCytJ6KLbXO7UI4Zh02ItEf3gEsxElwejpYgwFSA6JQwdzPdblgeoqaWKp8y/IKx
	 qtYl6YTIO7HWlzrBVaA7BrDXnJk8jN63gngf0Ued48fHYaowwtqo8hjF3dbKjFaHpG1Vo
	 NezhTYhMHQF6LUnlTtobL5HM6uM4V1jy4+x4e2ERIMtwZ/d1sMz/iMB3fTVoagmWHUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0PXwHeGALupf0331RmW1wRjuSer7MEVZbJRazHgd5E8=;
	b=pCh42VMiTTHSOTAwmbnx60OAVd/1lYdkKJfOUshafKLTkdMEBzW58AuMd58oHj83AfSo
	 0MCESDAhVDbhBk6bZYGmUzt6MCDqClWmMmyX9GNhxKqwWsNcu5a8Uj7J0Sqjm2FEZcT8v
	 ArEwpUKgvpMJYoI/j+T4eRysUqtyjDCA0j0l1QdXYbD+CKW7R74m/02pkDQlev84vSA+e
	 9UUP/99+XJQNUy5O6ocll3/nD3vO5JPs+5d1BcjiI7Ahb5LXQ6Iwae9bbHJQfqyoj2wfS
	 KJFgMm2x8ap0Kd9lWtT1tOVJfLaSKxI5W6XZcP3nO7nvqjSR20xWiF6hUO/chkesmbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vlARALGr;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719A960A263A
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 00:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 719A960A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vlARALGr
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-714d57774d8so887278eaf.1
        for <loongarch@lists.linux.dev>; Mon, 09 Nov 2026 16:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269028; x=1794873828; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PXwHeGALupf0331RmW1wRjuSer7MEVZbJRazHgd5E8=;
        b=vlARALGrlspGouKBU/1BCyw0iH3MQeiqBphW2CUjnNCULHHFHT6jO1dk+NI/9mLMiN
         EFcA9W6jZork8BpH7kiV9oT2KIiGPWbsbuIRO30ZLRFCW3rq79nJjs8ZJGeZLxS3bjYr
         S5P4ToE9FnrmUp98aDZreF5it6h8dXwXYbbr+bfQK9la++xRzad/mgqW4Rn413EbWD1n
         O3m6EbO/cYQpmM81DFW2iOaMyIu7KjC6DmqBkyanCog4pknnpk5JleX28CZ6IMAj/aYv
         HAScEsUBqC/3nKxifv/xFm63k+gssvNlRi2N+RdvdA6nqumIhzcmukDlTPqZ9u/OFnvC
         WHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269028; x=1794873828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0PXwHeGALupf0331RmW1wRjuSer7MEVZbJRazHgd5E8=;
        b=Vj985Euz/Mt5BRlmtE+scPgPjyNO2KL8FzNyuS/cFcn4/z+htQlL/+kZ5ihi3k0Fn/
         6ugyXggXbvwApK2kh88DfwTcInRtYhVLK5YrSRV+uIjEUCPFq09UtYAW9a1wVUxn2UJ9
         xh1wvbpGSiEILKjbhw9eztbm+QGo17zDBWB7z07UOMZ6vtes2OwGuOLZj2hl7fmJLslO
         2zxComs6zbOdvHsBdbHXfhAiFWFrQeBTVpE+8dur+K+EVKYGWY17Ai03SJiySawsOcVG
         DV8vn9+U8jPwbwNQGCYpBDKj/MxPOLTudT5IO6z2TWOkkiA1mOrv2PSSPXG8Xalh9gxA
         dRAQ==
X-Forwarded-Encrypted: i=1; AL+hErFgZFDJiJUpxzv7AyhfBelzObywZzWm92nzlBsubi93s2q6667n5S/yMkB77OxSlH+LAoztAytio/0=@lists.linux.dev
X-Gm-Message-State: APuU4Z+p97teLIqGlkrIWCtygAjFTXjwFCYyyd2tYx8EwUzPCp3Z33Z0
	OlULh3KVAkEPNbh7+knxWuPN/9P2A/POGkjEw70uZu6USuH2RdWEEyl5
X-Gm-Gg: AYBFou2Zs3O6aVn/EW3WSijwN/Bey893HsydSC/WsiXsjr0grGu+ripedCwCATtxCpM
	BypVm7dQfY2jjQP9yWhoYKlmk3KQIAbAKuZOV/+t+C6CUxVlqbTu9wIHcTHFSzi5MOcsxxwaARx
	26swReAK3ALrGEmABPu56OSSLjGZ6ZbKWwHZMW+gKYfIRcuMFnOsYCG80mD+iUbDDT55mFlmxuB
	rt2UyFLcIKWvnSoCj1c7Jh7heKFu7aJc1fmuYoKpC3wirlJ4O4r1oSQLgABMD8FawFO60GON8Wj
	bI5zVtMKXScOEW6HIYs0py+2cLXkOG2uf3ZKJtpJd+0tXoYLeH12Y6Cb+XcVnWsL7KRn5NwzQzy
	xy6n4jFKS1pC2cSRs1+M8tHcGnpLA09uH+Y6yCHud+jPu0FIRRUpyDY/XclwBs4fVhi98Kk8gd5
	Z3ahGbVZfLJITuoMYEZRzMDv7bvRFjPdA0Mc0494TBs2ow7UhHl0YdgP1a9PNs+mCoVy38t6v26
	ShK5iwTGBInXsujhn/1Kiv5u91R5h9KW1n0xmei/bllM9Q9JG9kJoj0z1Vq5cVgwBiMGWMjyPMU
	4F/R6lgc6gxdGxvgIBfOjN7RuO5UC14AHhUAi/nvb1s=
X-Received: by 2002:a05:6820:338a:20b0:702:f7c2:1937 with SMTP id 006d021491bc7-718a7adc206mr309940eaf.83.1794269028466;
        Mon, 09 Nov 2026 16:03:48 -0800 (PST)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718aa03dbeasm513036eaf.12.2026.11.09.16.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:03:47 -0800 (PST)
From: Leizhen Zhang <lzsx618@gmail.com>
To: jpoimboe@kernel.org,
	peterz@infradead.org
Cc: yangtiezhu@loongson.cn,
	chenhuacai@kernel.org,
	alexandre.chartre@oracle.com,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH 3/3] objtool: Fix misaligned load of the alternative feature word
Date: Mon,  9 Nov 2026 18:02:55 -0600
Message-Id: <20261110000255.1720945-4-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110000255.1720945-1-lzsx618@gmail.com>
References: <20261110000255.1720945-1-lzsx618@gmail.com>
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

get_alt_entry() reads the feature word of a group alternative through
an 'unsigned int *' at offset + entry->feature.  On x86 struct alt_instr
is packed and 14 bytes long (ALT_ENTRY_SIZE) with the feature word at
offset 8, so for every odd-numbered .altinstructions entry the load is
only 2-byte aligned.  That is undefined behaviour in C, and UBSan
reports it on an x86_64 defconfig build of v7.4-rc2:

  special.c:84:18: runtime error: load of misaligned address 0x52e000018416 for type 'unsigned int', which requires 4 byte alignment

x86 hosts tolerate the access, but objtool may run on hosts that do
not, and the compiler is allowed to assume the alignment.  Copy the
value out with memcpy() instead.  Running objtool with and without
this patch on the same defconfig vmlinux.o gives byte-identical output.

The report was found with UBSan, and the analysis and fix were
prepared with the help of an AI coding assistant; I reviewed and
tested the result.

Fixes: be5ee60ac554 ("objtool: Provide access to feature and flags of group alternatives")
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 tools/objtool/special.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/special.c b/tools/objtool/special.c
index 2a533afbc69a..5df169d0e45d 100644
--- a/tools/objtool/special.c
+++ b/tools/objtool/special.c
@@ -81,8 +81,8 @@ static int get_alt_entry(struct elf *elf, const struct special_entry *entry,
 						   entry->orig_len);
 		alt->new_len = *(unsigned char *)(sec->data->d_buf + offset +
 						  entry->new_len);
-		alt->feature = *(unsigned int *)(sec->data->d_buf + offset +
-						 entry->feature);
+		memcpy(&alt->feature, sec->data->d_buf + offset + entry->feature,
+		       sizeof(alt->feature));
 	}
 
 	orig_reloc = find_reloc_by_dest(elf, sec, offset + entry->orig);
-- 
2.34.1

