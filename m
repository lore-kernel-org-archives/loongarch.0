Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC394281508
	for <loongarch@lists.linux.dev>; Wed, 27 Aug 2025 11:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293587; cv=none; b=UO8soLxe/TUZNpSYFxqnCZir8e9Vve6xBT5276RgOWm7GgSx98UdszOmQeXHENa4vTrRMZLuUrawCzoW2BIZdEz3bwoSFjKHVie5uPTua6a1xt4cS52TPU2V/RqwPDJIoKbk4ClinOa6hsiqSg9rVOGDLMlADpTv73VokCXhZ1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293587; c=relaxed/simple;
	bh=ltYS2QOn/5zkyHWiC96blfmcGl9cf4ZferaS1apQjUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fjH7fD5r9qIp62Eb6swL9bEO4I2+veN9liztmFK3jIlPu+5KvwB48l+10Of0OeEoOdHJwmZJAvby0c4kU8OM+afqQfxTgZzMcP+pXnGXln7067kLLfvOzclXF2oYyrSj7L6yc+KOtEtOWm7QfAEmrZqTty/xnQOU4zLB7YLymNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHQVwA6p; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHQVwA6p"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-323267bc2eeso4981325a91.1
        for <loongarch@lists.linux.dev>; Wed, 27 Aug 2025 04:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293585; x=1756898385; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N56x/PK4IopNz9cbwZEZJpWMxCF6ZLggsQFAooEkPd0=;
        b=OHQVwA6p/tiEt4KZTRj/2mYgXXX4CTVN5t8NADuMjsH1rsTBTRDNnkA4K7ElaQ9qyp
         djm9lHyHCVJFSBryBHl9d31+GDyzB3yQnjzga5jBdwpOfOPsjIi+tbMCKc3cbs5lWWx4
         z5sV4QQpYfIeDw59N0LxXfCzhTiWjADLD+TxACH9Ka2FBlcKbZiyWccaTavTPXRiQ9Y4
         xC0nXlGVaAYhG8U8tDzedA9iV2AhB3yzEXkXvDRcZfswTQCd1pncxYfCwsLLi0FbGTdn
         xnEiD6YIQbhSrftWtlyyeUycCmxc/gThlprPBqsVPmdI/acWvGazgvDa70gcJS6ydQpu
         rZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293585; x=1756898385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N56x/PK4IopNz9cbwZEZJpWMxCF6ZLggsQFAooEkPd0=;
        b=cwDmUN07Cqi7X/rrGVvG8vfVBcqJbQFVEvd1hk4VOz6IQIQ1/0a/li2D31LD5J91WJ
         s0y7OnJAN1/4gHyoLHHxR28PsojfsoQmTGIPZ5KnYDWnOEZA5Ypn8ODu/xwRGLZKle/R
         WIrbd96LJBwWCDPLFmoZxUPuMig6mRffpawX/YfsyUQrqKy7dsS245xjS9FvG6Lzj1DV
         vipMm8TMkND5/9x4wkMTO1siF12OMtlA2QPC9S6TLSbMbGCicYPVehjU8ym2SGIwteIl
         QO8cEgVXXfyUw4pXDUhpf/DPK4UXbOGsFfQNDBwn2pPGbl6xZEcBNKQ7kiNmS5XNWvdi
         kGtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaCJ1D1bx4XEAP/o/VsX7nHKhdgpuYKY+24ihqPKeB09X6KFFSi/6z6hU1qU+OYi9PLnppeBMQNs8=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywfy0iRYBPOyK7rQE21tKA/BWMeH0U047xedPBvd97OiwiVMJL6
	8CABr4oRCHW+p7aJ5ATfbQPl9I+TcnpocKfnaHkXK8fK6wJ8+D0rMQR9
X-Gm-Gg: ASbGncvf3Tm/1MDBxZuJEA6qpyLLd8aRvwZZWVurvc4lG/iao+EKHmuGiFowU88tfyk
	BbsbCGZmK9xNDdakLOrOz925VEfTVUKdYC/MYKwH89/LgBpI4LBl/VDM/pohNbEY0CLye9R8OZr
	w0m0oS9TRt8LD9nfyXSO2DzcZ3Vl2CBQ18QnTa+OwnR+hFzz5fQ2CEw92htO1Lo+QRVo592GT5N
	CEK6DHhNWN1eKqR8+u6Uy1hK/RUre145GxW9UBvei0ir7ASGtplECFpyLwS47fc7Z7huFj001mX
	lQeeB9PZ/urYvX01tOq+JvHfgg6PYN/NGEYqOaJdH2NOdx9jTJW7fcVm01eoyEsZk42Nd9m5sKc
	YRDJF58mUtaBKgJU0YrZgedEb0JL1JfVps31vh4W5
X-Google-Smtp-Source: AGHT+IGlp/WS+KoJo65YB3dx5lC2D3A6/fIHq1VCh47XTGTq4ZHX3GWlF7i0uB8rmnhH8bly4XtPxg==
X-Received: by 2002:a17:90b:2686:b0:327:5d06:4d8 with SMTP id 98e67ed59e1d1-3275d060767mr5033570a91.31.1756293585171;
        Wed, 27 Aug 2025 04:19:45 -0700 (PDT)
Received: from devbox.. ([43.132.141.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f8a3335sm1829729a91.13.2025.08.27.04.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:19:44 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	jianghaoran@kylinos.cn,
	duanchenghao@kylinos.cn,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	vincent.mc.li@gmail.com
Cc: bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v2 2/3] LoongArch: BPF: Sign extend struct ops return values properly
Date: Wed, 27 Aug 2025 09:47:32 +0000
Message-ID: <20250827094733.426839-3-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827094733.426839-1-hengqi.chen@gmail.com>
References: <20250827094733.426839-1-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ns_bpf_qdisc selftest triggers a kernel panic:

    CPU 0 Unable to handle kernel paging request at virtual address 0000000000741d58, era == 90000000851b5ac0, ra == 90000000851b5aa4
    Oops[#1]:
    CPU: 0 UID: 0 PID: 449 Comm: test_progs Tainted: G           OE       6.16.0+ #3 PREEMPT(full)
    Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
    Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 2/2/2022
    pc 90000000851b5ac0 ra 90000000851b5aa4 tp 90000001076b8000 sp 90000001076bb600
    a0 0000000000741ce8 a1 0000000000000001 a2 90000001076bb5c0 a3 0000000000000008
    a4 90000001004c4620 a5 9000000100741ce8 a6 0000000000000000 a7 0100000000000000
    t0 0000000000000010 t1 0000000000000000 t2 9000000104d24d30 t3 0000000000000001
    t4 4f2317da8a7e08c4 t5 fffffefffc002f00 t6 90000001004c4620 t7 ffffffffc61c5b3d
    t8 0000000000000000 u0 0000000000000001 s9 0000000000000050 s0 90000001075bc800
    s1 0000000000000040 s2 900000010597c400 s3 0000000000000008 s4 90000001075bc880
    s5 90000001075bc8f0 s6 0000000000000000 s7 0000000000741ce8 s8 0000000000000000
       ra: 90000000851b5aa4 __qdisc_run+0xac/0x8d8
      ERA: 90000000851b5ac0 __qdisc_run+0xc8/0x8d8
     CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
     PRMD: 00000004 (PPLV0 +PIE -PWE)
     EUEN: 00000007 (+FPE +SXE +ASXE -BTE)
     ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
    ESTAT: 00010000 [PIL] (IS= ECode=1 EsubCode=0)
     BADV: 0000000000741d58
     PRID: 0014c010 (Loongson-64bit, Loongson-3A5000)
    Modules linked in: bpf_testmod(OE) [last unloaded: bpf_testmod(OE)]
    Process test_progs (pid: 449, threadinfo=000000009af02b3a, task=00000000e9ba4956)
    Stack : 0000000000000000 90000001075bc8ac 90000000869524a8 9000000100741ce8
            90000001075bc800 9000000100415300 90000001075bc8ac 0000000000000000
            900000010597c400 900000008694a000 0000000000000000 9000000105b59000
            90000001075bc800 9000000100741ce8 0000000000000050 900000008513000c
            9000000086936000 0000000100094d4c fffffff400676208 0000000000000000
            9000000105b59000 900000008694a000 9000000086bf0dc0 9000000105b59000
            9000000086bf0d68 9000000085147010 90000001075be788 0000000000000000
            9000000086bf0f98 0000000000000001 0000000000000010 9000000006015840
            0000000000000000 9000000086be6c40 0000000000000000 0000000000000000
            0000000000000000 4f2317da8a7e08c4 0000000000000101 4f2317da8a7e08c4
            ...
    Call Trace:
    [<90000000851b5ac0>] __qdisc_run+0xc8/0x8d8
    [<9000000085130008>] __dev_queue_xmit+0x578/0x10f0
    [<90000000853701c0>] ip6_finish_output2+0x2f0/0x950
    [<9000000085374bc8>] ip6_finish_output+0x2b8/0x448
    [<9000000085370b24>] ip6_xmit+0x304/0x858
    [<90000000853c4438>] inet6_csk_xmit+0x100/0x170
    [<90000000852b32f0>] __tcp_transmit_skb+0x490/0xdd0
    [<90000000852b47fc>] tcp_connect+0xbcc/0x1168
    [<90000000853b9088>] tcp_v6_connect+0x580/0x8a0
    [<90000000852e7738>] __inet_stream_connect+0x170/0x480
    [<90000000852e7a98>] inet_stream_connect+0x50/0x88
    [<90000000850f2814>] __sys_connect+0xe4/0x110
    [<90000000850f2858>] sys_connect+0x18/0x28
    [<9000000085520c94>] do_syscall+0x94/0x1a0
    [<9000000083df1fb8>] handle_syscall+0xb8/0x158

    Code: 4001ad80  2400873f  2400832d <240073cc> 001137ff  001133ff  6407b41f  001503cc  0280041d

    ---[ end trace 0000000000000000 ]---

The bpf_fifo_dequeue prog returns a skb which is a pointer.
The pointer is treated as a 32bit value and sign extend to
64bit in epilogue. This behavior is right for most bpf prog
types but wrong for struct ops which requires LoongArch ABI.

So let's sign extend struct ops return values according to
the return value spec in function model.

Fixes: 6abf17d690d8 ("LoongArch: BPF: Add struct ops support for trampoline")
Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Tested-by: Vincent Li <vincent.mc.li@gmail.com>
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index b646c6b73014..c239e5ed0c92 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1448,6 +1448,28 @@ void arch_free_bpf_trampoline(void *image, unsigned int size)
 	bpf_prog_pack_free(image, size);
 }
 
+/*
+ * Sign-extend the register if necessary
+ */
+static void sign_extend(struct jit_ctx *ctx, int r, u8 size)
+{
+	switch (size) {
+	case 1:
+		emit_insn(ctx, extwb, r, r);
+		break;
+	case 2:
+		emit_insn(ctx, extwh, r, r);
+		break;
+	case 4:
+		emit_insn(ctx, addiw, r, r, 0);
+		break;
+	case 8:
+		break;
+	default:
+		pr_warn("bpf_jit: invalid size %d for sign_extend\n", size);
+	}
+}
+
 static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 					 const struct btf_func_model *m, struct bpf_tramp_links *tlinks,
 					 void *func_addr, u32 flags)
@@ -1654,6 +1676,10 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 	if (save_ret) {
 		emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -retval_off);
 		emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARCH_GPR_FP, -(retval_off - 8));
+		if (is_struct_ops) {
+			move_reg(ctx, LOONGARCH_GPR_A0, regmap[BPF_REG_0]);
+			sign_extend(ctx, LOONGARCH_GPR_A0, m->ret_size);
+		}
 	}
 
 	emit_insn(ctx, ldd, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -sreg_off);
-- 
2.43.5


